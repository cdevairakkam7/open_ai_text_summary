from fastapi import FastAPI, HTTPException
from fastapi.middleware.cors import CORSMiddleware
from fastapi.staticfiles import StaticFiles
from fastapi.responses import HTMLResponse
from pydantic import BaseModel
from openai import OpenAI
import os
from dotenv import load_dotenv
from typing import List, Dict

# Load environment variables from .env file
load_dotenv()

# Initialize FastAPI app
app = FastAPI(title="OpenAI Chat API")

# Add CORS middleware
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# Initialize OpenAI client
client = OpenAI(api_key=os.getenv("OPENAI_API_TOKEN"))

# Store conversation history (in production, use a database or session management)
conversation_history: List[Dict[str, str]] = [
    {
        "role": "system",
        "content": "You are a text summarization assistant. Your job is to summarize long texts into concise bullet points. ALWAYS format your response using bullet points (•) or dashes (-). Each key point should be on a separate line. Never provide summaries without bullet points."
    }
]

# Request model
class ChatRequest(BaseModel):
    message: str
    model: str = "gpt-4o-mini"
    temperature: float = 0.0
    max_tokens: int = 100
    reset_history: bool = False

# Response model
class ChatResponse(BaseModel):
    response: str

@app.get("/", response_class=HTMLResponse)
async def read_root():
    """Serve the frontend HTML"""
    with open("templates/index.html", "r") as f:
        return f.read()

@app.post("/chat", response_model=ChatResponse)
async def chat(request: ChatRequest):
    """
    Send a message to OpenAI and get a response with conversation history
    """
    global conversation_history

    try:
        # Reset history if requested
        if request.reset_history:
            conversation_history = [
                {
                    "role": "system",
                    "content": "You are a text summarization assistant. Your job is to summarize long texts into concise bullet points. ALWAYS format your response using bullet points (•) or dashes (-). Each key point should be on a separate line. Never provide summaries without bullet points."
                }
            ]

        # Add user message to history
        conversation_history.append({
            "role": "user",
            "content": request.message
        })

        # Get response from OpenAI with full conversation history
        response = client.chat.completions.create(
            model=request.model,
            messages=conversation_history,
            temperature=request.temperature,
            max_tokens=request.max_tokens
        )

        # Get assistant's reply
        assistant_message = response.choices[0].message.content

        # Add assistant's reply to history for next turn
        conversation_history.append({
            "role": "assistant",
            "content": assistant_message
        })

        return ChatResponse(
            response=assistant_message
        )
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))

@app.get("/health")
async def health_check():
    """Health check endpoint"""
    return {"status": "healthy"}

if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="0.0.0.0", port=8000)
