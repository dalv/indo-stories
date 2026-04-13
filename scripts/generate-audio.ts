import { readFileSync, writeFileSync, existsSync, mkdirSync } from "fs";
import { join } from "path";

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

interface Story {
  id: string;
  indo: string[];
}

function loadStories(): Story[] {
  const dataPath = join(process.cwd(), "scripts", "stories-data.json");
  return JSON.parse(readFileSync(dataPath, "utf-8"));
}

interface AlignmentWord {
  word: string;
  start: number;
  end: number;
  paragraphIndex: number;
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

  // Join paragraphs with newline so we can track paragraph boundaries
  const fullText = story.indo.join("\n");

  console.log(`  Generating audio for "${story.id}" (${fullText.length} chars)...`);

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

  // Write MP3
  const audioBuffer = Buffer.from(audio_base64, "base64");
  writeFileSync(mp3Path, audioBuffer);
  console.log(`  Wrote ${mp3Path} (${(audioBuffer.length / 1024).toFixed(1)} KB)`);

  // Build word-level alignment from character-level data
  const chars: string[] = alignment.characters;
  const startTimes: number[] = alignment.character_start_times_seconds;
  const endTimes: number[] = alignment.character_end_times_seconds;

  const words: AlignmentWord[] = [];
  let currentWord = "";
  let wordStart = -1;
  let wordEnd = -1;
  let paragraphIndex = 0;

  for (let i = 0; i < chars.length; i++) {
    const ch = chars[i];

    if (ch === "\n") {
      if (currentWord) {
        words.push({
          word: currentWord,
          start: wordStart,
          end: wordEnd,
          paragraphIndex,
        });
        currentWord = "";
        wordStart = -1;
      }
      paragraphIndex++;
      continue;
    }

    if (/\s/.test(ch)) {
      if (currentWord) {
        words.push({
          word: currentWord,
          start: wordStart,
          end: wordEnd,
          paragraphIndex,
        });
        currentWord = "";
        wordStart = -1;
      }
    } else {
      if (!currentWord) {
        wordStart = startTimes[i];
      }
      currentWord += ch;
      wordEnd = endTimes[i];
    }
  }

  if (currentWord) {
    words.push({
      word: currentWord,
      start: wordStart,
      end: wordEnd,
      paragraphIndex,
    });
  }

  const duration = endTimes.length > 0 ? endTimes[endTimes.length - 1] : 0;

  const alignmentOut = { duration, words };
  writeFileSync(jsonPath, JSON.stringify(alignmentOut, null, 2));
  console.log(`  Wrote ${jsonPath} (${words.length} words)`);
}

async function main() {
  const force = process.argv.includes("--force");
  console.log("Loading stories...");
  const stories = loadStories();
  console.log(`Found ${stories.length} stories\n`);

  for (const story of stories) {
    await generateForStory(story, force);
    console.log();
  }

  console.log("Done!");
}

main().catch(console.error);
