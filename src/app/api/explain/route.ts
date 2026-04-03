import Anthropic from "@anthropic-ai/sdk";
import { NextRequest, NextResponse } from "next/server";

const client = new Anthropic();

export async function POST(req: NextRequest) {
  const { word, paragraph, englishParagraph } = await req.json();

  if (!word || !paragraph) {
    return NextResponse.json({ error: "Missing word or paragraph" }, { status: 400 });
  }

  const message = await client.messages.create({
    model: "claude-sonnet-4-6-20250514",
    max_tokens: 300,
    messages: [
      {
        role: "user",
        content: `You are helping someone learn Indonesian. They tapped the word "${word}" in this Indonesian paragraph:

"${paragraph}"

The English translation of this paragraph is:

"${englishParagraph}"

Respond in this exact JSON format (no markdown, no code fences):
{"translation": "<English translation of just the word>", "explanation": "<1-2 sentence explanation of why this word is used in this context, including any nuance or colloquial usage>"}`,
      },
    ],
  });

  const text = message.content[0].type === "text" ? message.content[0].text : "";

  try {
    const parsed = JSON.parse(text);
    return NextResponse.json(parsed);
  } catch {
    return NextResponse.json({ translation: text, explanation: "" });
  }
}
