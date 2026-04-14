import { readFileSync, writeFileSync, existsSync, mkdirSync, unlinkSync } from "fs";
import { join } from "path";
import { execSync } from "child_process";

// Load .env.local
const envPath = join(process.cwd(), ".env.local");
if (existsSync(envPath)) {
  const envContent = readFileSync(envPath, "utf-8");
  for (const line of envContent.split("\n")) {
    const match = line.match(/^([^#=]+)=(.*)$/);
    if (match) {
      process.env[match[1].trim()] = match[2].trim();
    }
  }
}

const API_KEY = process.env.ELEVENLABS_API_KEY!;
if (!API_KEY) {
  console.error("Missing ELEVENLABS_API_KEY in .env.local or environment");
  process.exit(1);
}

const VOICE_ID = "Y5oW6g8hng3zAbclT1hH"; // Shea Momogi - Calm, Soothing and Warm
const MODEL_ID = "eleven_multilingual_v2";

// Minimum gap (seconds) between different lines. If shorter, ffmpeg pads with silence.
const MIN_LINE_GAP = 1.5;

interface Story {
  id: string;
  indo: string[];
}

interface AlignmentWord {
  word: string;
  start: number;
  end: number;
  paragraphIndex: number;
}

interface SectionWord {
  word: string;
  start: number;
  end: number;
  section: number;
}

function loadStories(): Story[] {
  const dataPath = join(process.cwd(), "scripts", "dialogues-data.json");
  return JSON.parse(readFileSync(dataPath, "utf-8"));
}

async function generateForStory(story: Story, force: boolean) {
  const outDir = join(process.cwd(), "public", "audio");
  mkdirSync(outDir, { recursive: true });

  const mp3Path = join(outDir, `${story.id}.mp3`);
  const jsonPath = join(outDir, `${story.id}.json`);

  if (!force && existsSync(mp3Path) && existsSync(jsonPath)) {
    console.log(`  Skipping ${story.id} (files exist, use --force to regenerate)`);
    return;
  }

  // Each line said twice: first reading, small pause, second reading, bigger pause before next line
  // Text structure per line: "line\n<break 0.5s>\nline"
  // Between lines: "\n<break 1.5s>\n"
  //
  // Section indices (incrementing on each \n):
  //   0: line1 first reading  → CAPTURE (paragraphIndex 0)
  //   1: <break 0.5s>
  //   2: line1 second reading → SKIP
  //   3: <break 1.5s>
  //   4: line2 first reading  → CAPTURE (paragraphIndex 1)
  //   ...
  // Pattern: capture when section % 4 === 0, paragraphIndex = section / 4

  const fullText = story.indo
    .map((line) => `${line}\n<break time="0.5s" />\n${line}`)
    .join('\n<break time="1.5s" />\n');

  console.log(`  Calling ElevenLabs for "${story.id}" (${story.indo.length} lines)...`);

  const response = await fetch(
    `https://api.elevenlabs.io/v1/text-to-speech/${VOICE_ID}/with-timestamps`,
    {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        "xi-api-key": API_KEY,
      },
      body: JSON.stringify({
        text: fullText,
        model_id: MODEL_ID,
        language_code: "id",
        voice_settings: {
          stability: 0.4,
          similarity_boost: 0.75,
          style: 0.45,
        },
      }),
    }
  );

  if (!response.ok) {
    const err = await response.text();
    console.error(`  API error for ${story.id}: ${response.status} ${err}`);
    return;
  }

  const data = await response.json();
  const { audio_base64, alignment } = data;

  // Parse character-level alignment
  const chars: string[] = alignment.characters;
  const starts: number[] = alignment.character_start_times_seconds;
  const ends: number[] = alignment.character_end_times_seconds;

  const words: AlignmentWord[] = [];
  const allWords: SectionWord[] = [];

  let currentWord = "";
  let wordStart = -1;
  let wordEnd = -1;
  let section = 0;
  let insideTag = false;

  function flushWord() {
    if (!currentWord) return;
    const entry: SectionWord = {
      word: currentWord,
      start: wordStart,
      end: wordEnd,
      section,
    };
    allWords.push(entry);
    // Only capture first readings (section % 4 === 0)
    if (section % 4 === 0) {
      words.push({
        word: currentWord,
        start: wordStart,
        end: wordEnd,
        paragraphIndex: Math.floor(section / 4),
      });
    }
    currentWord = "";
    wordStart = -1;
  }

  for (let i = 0; i < chars.length; i++) {
    const ch = chars[i];

    if (ch === "<") {
      flushWord();
      insideTag = true;
      continue;
    }
    if (insideTag) {
      if (ch === ">") insideTag = false;
      continue;
    }
    if (ch === "\n") {
      flushWord();
      section++;
      continue;
    }
    if (/\s/.test(ch)) {
      flushWord();
    } else {
      if (!currentWord) wordStart = starts[i];
      currentWord += ch;
      wordEnd = ends[i];
    }
  }
  flushWord();

  console.log(
    `  Parsed ${words.length} first-reading words, ${allWords.length} total words`
  );

  // Find gaps between lines:
  // gap = end of second reading of line N (section N*4+2)
  //     → start of first reading of line N+1 (section (N+1)*4)
  const lineCount = story.indo.length;
  interface GapInfo {
    gapStart: number;
    gapEnd: number;
  }
  const gaps: GapInfo[] = [];

  for (let line = 0; line < lineCount - 1; line++) {
    const secondReadingSection = line * 4 + 2;
    const nextFirstSection = (line + 1) * 4;
    const lastOfSecond = allWords
      .filter((w) => w.section === secondReadingSection)
      .pop();
    const firstOfNext = allWords.find(
      (w) => w.section === nextFirstSection
    );
    if (lastOfSecond && firstOfNext) {
      gaps.push({ gapStart: lastOfSecond.end, gapEnd: firstOfNext.start });
    }
  }

  const rawDuration = ends.length > 0 ? ends[ends.length - 1] : 0;

  // Log gap info
  for (let i = 0; i < gaps.length; i++) {
    const g = gaps[i];
    const dur = (g.gapEnd - g.gapStart).toFixed(2);
    const status = g.gapEnd - g.gapStart < MIN_LINE_GAP ? " (will pad)" : "";
    console.log(`  Gap after line ${i}: ${dur}s${status}`);
  }

  // Check if ffmpeg padding is needed
  const needsPadding = gaps.some(
    (g) => g.gapEnd - g.gapStart < MIN_LINE_GAP
  );

  if (needsPadding) {
    console.log(`  Padding short gaps with ffmpeg...`);

    const tempMp3 = join(outDir, `${story.id}_raw.mp3`);
    writeFileSync(tempMp3, Buffer.from(audio_base64, "base64"));

    // Get sample rate from the generated audio
    const probeJson = execSync(
      `ffprobe -v quiet -print_format json -show_streams "${tempMp3}"`
    ).toString();
    const streams = JSON.parse(probeJson).streams;
    const sampleRate = streams[0]?.sample_rate || "44100";
    const channelLayout = streams[0]?.channel_layout || "mono";

    // Build cut points at gap midpoints with silence durations
    const cuts: { time: number; silenceDur: number }[] = [];
    for (const gap of gaps) {
      const mid =
        Math.round(((gap.gapStart + gap.gapEnd) / 2) * 1000) / 1000;
      const existing = gap.gapEnd - gap.gapStart;
      const needed = Math.max(
        0,
        Math.round((MIN_LINE_GAP - existing) * 1000) / 1000
      );
      cuts.push({ time: mid, silenceDur: needed });
    }

    // Build ffmpeg filter_complex
    const filterParts: string[] = [];
    const concatLabels: string[] = [];
    let prev = 0;

    for (let i = 0; i < cuts.length; i++) {
      const cut = cuts[i];
      filterParts.push(
        `[0]atrim=${prev}:${cut.time},asetpts=PTS-STARTPTS[s${i}]`
      );
      concatLabels.push(`[s${i}]`);

      if (cut.silenceDur > 0) {
        filterParts.push(
          `anullsrc=r=${sampleRate}:cl=${channelLayout},atrim=duration=${cut.silenceDur},asetpts=PTS-STARTPTS[g${i}]`
        );
        concatLabels.push(`[g${i}]`);
      }
      prev = cut.time;
    }

    // Last segment
    filterParts.push(
      `[0]atrim=${prev},asetpts=PTS-STARTPTS[slast]`
    );
    concatLabels.push(`[slast]`);

    const fc =
      filterParts.join(";") +
      `;${concatLabels.join("")}concat=n=${concatLabels.length}:v=0:a=1[out]`;

    execSync(
      `ffmpeg -y -i "${tempMp3}" -filter_complex '${fc}' -map "[out]" "${mp3Path}"`,
      { stdio: "pipe" }
    );
    unlinkSync(tempMp3);

    // Adjust word timestamps: for time T, add cumulative silence from all cut points before T
    const totalAdded = cuts.reduce((sum, c) => sum + c.silenceDur, 0);

    function adjustTime(t: number): number {
      let offset = 0;
      for (const cut of cuts) {
        if (t >= cut.time) offset += cut.silenceDur;
        else break;
      }
      return Math.round((t + offset) * 1000) / 1000;
    }

    for (const w of words) {
      w.start = adjustTime(w.start);
      w.end = adjustTime(w.end);
    }

    const finalDuration =
      Math.round((rawDuration + totalAdded) * 1000) / 1000;
    const finalSize = readFileSync(mp3Path).length;
    console.log(
      `  Wrote ${mp3Path} (${(finalSize / 1024).toFixed(1)} KB)`
    );
    writeFileSync(
      jsonPath,
      JSON.stringify({ duration: finalDuration, words }, null, 2)
    );
    console.log(
      `  Wrote ${jsonPath} (${words.length} words, ${story.indo.length} paragraphs, ${finalDuration.toFixed(1)}s)`
    );
  } else {
    // No padding needed — write audio and alignment directly
    const audioBuffer = Buffer.from(audio_base64, "base64");
    writeFileSync(mp3Path, audioBuffer);
    console.log(
      `  Wrote ${mp3Path} (${(audioBuffer.length / 1024).toFixed(1)} KB)`
    );
    writeFileSync(
      jsonPath,
      JSON.stringify({ duration: rawDuration, words }, null, 2)
    );
    console.log(
      `  Wrote ${jsonPath} (${words.length} words, ${story.indo.length} paragraphs, ${rawDuration.toFixed(1)}s)`
    );
  }
}

async function main() {
  const force = process.argv.includes("--force");
  console.log("Loading dialogue stories...");
  const stories = loadStories();
  console.log(`Found ${stories.length} stories\n`);

  for (const story of stories) {
    await generateForStory(story, force);
    console.log();
  }

  console.log("Done!");
}

main().catch(console.error);
