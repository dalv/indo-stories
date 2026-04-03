import Anthropic from "@anthropic-ai/sdk";
import { NextRequest, NextResponse } from "next/server";

const client = new Anthropic();

export async function POST(req: NextRequest) {
  const { word, paragraph, englishParagraph, question } = await req.json();

  if (!word || !paragraph || !question) {
    return NextResponse.json({ error: "Missing required fields" }, { status: 400 });
  }

  const message = await client.messages.create({
    model: "claude-3-haiku-20240307",
    max_tokens: 300,
    messages: [
      {
        role: "user",
        content: `You are helping someone learn Indonesian. They are looking at the word "${word}" in this Indonesian paragraph:

"${paragraph}"

The English translation is:

"${englishParagraph}"

They have a follow-up question: "${question}"

Answer concisely in 1-3 sentences. Focus on practical Indonesian language learning.`,
      },
    ],
  });

  const text = message.content[0].type === "text" ? message.content[0].text : "";
  return NextResponse.json({ answer: text });
}
