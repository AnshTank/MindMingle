import { NextRequest, NextResponse } from "next/server";
import { GoogleGenerativeAI } from "@google/generative-ai";

export async function POST(req: NextRequest) {
  // Get prompt field from the request body
  const reqBody = await req.json();
  const { userPrompt } = reqBody;

  const prompt =
    "You are a mental health professional. You are talking to a patient who is suffering from depression. You want to help them feel better. So answer the following questions: " +
    userPrompt;

  const genAI = new GoogleGenerativeAI(process.env.GOOGLE_API_KEY as string);

  // Change the model here
  const model = genAI.getGenerativeModel({
    model: "gemini-1.5-pro-002",
    generationConfig: { maxOutputTokens: 400 },
  });

  try {
    const result = await model.generateContent(prompt);
    const response = await result.response;
    const text = response.text();

    return NextResponse.json({ text });
  } catch (error) {
    return NextResponse.json({
      text: "Unable to process the prompt. Please try again.",
    });
  }
}
