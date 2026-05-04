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

// Silence durations (seconds)
const PAUSE_BETWEEN_READINGS = 0.8; // pause between 1st and 2nd reading of same line
const PAUSE_BETWEEN_LINES = 1.5;    // pause between different lines

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

interface LineAudio {
  mp3Path: string;
  duration: number;
  words: { word: string; start: number; end: number }[];
}

function loadStories(): Story[] {
  const dataPath = join(process.cwd(), "scripts", "dialogues-data.json");
  return JSON.parse(readFileSync(dataPath, "utf-8"));
}

/** Call ElevenLabs for a single line of text. Returns mp3 buffer + word alignment. */
async function generateLine(
  text: string,
  tempDir: string,
  label: string
): Promise<{ buffer: Buffer; duration: number; words: { word: string; start: number; end: number }[] }> {
  const response = await fetch(
    `https://api.elevenlabs.io/v1/text-to-speech/${VOICE_ID}/with-timestamps`,
    {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        "xi-api-key": API_KEY,
      },
      body: JSON.stringify({
        text,
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
    throw new Error(`API error for ${label}: ${response.status} ${err}`);
  }

  const data = await response.json();
  const { audio_base64, alignment } = data;
  const buffer = Buffer.from(audio_base64, "base64");

  // Parse character-level alignment into words
  const chars: string[] = alignment.characters;
  const starts: number[] = alignment.character_start_times_seconds;
  const ends: number[] = alignment.character_end_times_seconds;

  const words: { word: string; start: number; end: number }[] = [];
  let currentWord = "";
  let wordStart = -1;
  let wordEnd = -1;

  for (let i = 0; i < chars.length; i++) {
    const ch = chars[i];
    if (/\s/.test(ch) || ch === "\n") {
      if (currentWord) {
        words.push({ word: currentWord, start: wordStart, end: wordEnd });
        currentWord = "";
        wordStart = -1;
      }
    } else {
      if (!currentWord) wordStart = starts[i];
      currentWord += ch;
      wordEnd = ends[i];
    }
  }
  if (currentWord) {
    words.push({ word: currentWord, start: wordStart, end: wordEnd });
  }

  const duration = ends.length > 0 ? ends[ends.length - 1] : 0;
  return { buffer, duration, words };
}

async function generateForStory(story: Story, force: boolean) {
  const outDir = join(process.cwd(), "public", "audio");
  const tempDir = join(outDir, `_temp_${story.id}`);
  mkdirSync(outDir, { recursive: true });

  const mp3Path = join(outDir, `${story.id}.mp3`);
  const jsonPath = join(outDir, `${story.id}.json`);

  if (!force && existsSync(mp3Path) && existsSync(jsonPath)) {
    console.log(`  Skipping ${story.id} (files exist, use --force to regenerate)`);
    return;
  }

  mkdirSync(tempDir, { recursive: true });

  console.log(`  Generating "${story.id}" (${story.indo.length} lines, each line = 2 API calls)...`);

  // For each line: generate twice (two separate API calls), collect alignment only from first
  const segments: { file: string; duration: number }[] = [];
  const allWords: AlignmentWord[] = [];
  let timeOffset = 0;

  for (let lineIdx = 0; lineIdx < story.indo.length; lineIdx++) {
    const lineText = story.indo[lineIdx];
    console.log(`    Line ${lineIdx + 1}/${story.indo.length}: "${lineText.substring(0, 50)}${lineText.length > 50 ? "..." : ""}"`);

    // First reading — capture word timestamps
    const first = await generateLine(lineText, tempDir, `${story.id}-L${lineIdx}-R1`);
    const firstPath = join(tempDir, `line${lineIdx}_r1.mp3`);
    writeFileSync(firstPath, first.buffer);
    segments.push({ file: firstPath, duration: first.duration });

    // Capture words with offset
    for (const w of first.words) {
      allWords.push({
        word: w.word,
        start: Math.round((timeOffset + w.start) * 1000) / 1000,
        end: Math.round((timeOffset + w.end) * 1000) / 1000,
        paragraphIndex: lineIdx,
      });
    }
    timeOffset += first.duration;

    // Silence between readings
    timeOffset += PAUSE_BETWEEN_READINGS;

    // Second reading — no word capture
    const second = await generateLine(lineText, tempDir, `${story.id}-L${lineIdx}-R2`);
    const secondPath = join(tempDir, `line${lineIdx}_r2.mp3`);
    writeFileSync(secondPath, second.buffer);
    segments.push({ file: secondPath, duration: second.duration });
    timeOffset += second.duration;

    // Silence between lines (except after last line)
    if (lineIdx < story.indo.length - 1) {
      timeOffset += PAUSE_BETWEEN_LINES;
    }
  }

  const totalDuration = Math.round(timeOffset * 1000) / 1000;

  // Get audio properties from first segment
  const probeJson = execSync(
    `ffprobe -v quiet -print_format json -show_streams "${segments[0].file}"`
  ).toString();
  const streams = JSON.parse(probeJson).streams;
  const sampleRate = streams[0]?.sample_rate || "44100";

  // Build ffmpeg concat with silence gaps
  // For each segment, add the audio file then a silence gap
  const filterParts: string[] = [];
  const concatLabels: string[] = [];
  const inputFiles: string[] = [];

  let inputIdx = 0;
  for (let lineIdx = 0; lineIdx < story.indo.length; lineIdx++) {
    // First reading
    const r1Idx = inputIdx++;
    inputFiles.push(segments[lineIdx * 2].file);
    filterParts.push(`[${r1Idx}]asetpts=PTS-STARTPTS[a${r1Idx}]`);
    concatLabels.push(`[a${r1Idx}]`);

    // Silence between readings
    const silR = `sr${lineIdx}`;
    filterParts.push(
      `anullsrc=r=${sampleRate}:cl=mono,atrim=duration=${PAUSE_BETWEEN_READINGS},asetpts=PTS-STARTPTS[${silR}]`
    );
    concatLabels.push(`[${silR}]`);

    // Second reading
    const r2Idx = inputIdx++;
    inputFiles.push(segments[lineIdx * 2 + 1].file);
    filterParts.push(`[${r2Idx}]asetpts=PTS-STARTPTS[a${r2Idx}]`);
    concatLabels.push(`[a${r2Idx}]`);

    // Silence between lines
    if (lineIdx < story.indo.length - 1) {
      const silL = `sl${lineIdx}`;
      filterParts.push(
        `anullsrc=r=${sampleRate}:cl=mono,atrim=duration=${PAUSE_BETWEEN_LINES},asetpts=PTS-STARTPTS[${silL}]`
      );
      concatLabels.push(`[${silL}]`);
    }
  }

  const fc =
    filterParts.join(";") +
    `;${concatLabels.join("")}concat=n=${concatLabels.length}:v=0:a=1[out]`;

  const inputArgs = inputFiles.map((f) => `-i "${f}"`).join(" ");

  console.log(`  Concatenating ${inputFiles.length} audio segments with ffmpeg...`);
  execSync(
    `ffmpeg -y ${inputArgs} -filter_complex '${fc}' -map "[out]" "${mp3Path}"`,
    { stdio: "pipe" }
  );

  // Clean up temp files
  for (const seg of segments) {
    if (existsSync(seg.file)) unlinkSync(seg.file);
  }
  try {
    execSync(`rmdir "${tempDir}"`, { stdio: "pipe" });
  } catch {}

  const finalSize = readFileSync(mp3Path).length;
  console.log(`  Wrote ${mp3Path} (${(finalSize / 1024).toFixed(1)} KB)`);

  // Write alignment
  const alignmentOut = { duration: totalDuration, words: allWords };
  writeFileSync(jsonPath, JSON.stringify(alignmentOut, null, 2));
  console.log(
    `  Wrote ${jsonPath} (${allWords.length} words, ${story.indo.length} paragraphs, ${totalDuration.toFixed(1)}s)`
  );
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
