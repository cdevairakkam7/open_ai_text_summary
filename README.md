# Text Summarization Bot

A web-based text summarization application powered by OpenAI's GPT-4o-mini model. This application provides a beautiful web interface for summarizing long texts into concise bullet points.

## Features

- **Web Interface**: Beautiful, responsive chat interface for text summarization
- **Configurable Parameters**: Adjust temperature and max tokens via the frontend
- **Multi-turn Conversations**: Maintains conversation history for context-aware responses
- **Real-time Processing**: Instant text summarization with loading indicators
- **System Role**: Pre-configured to summarize texts into bullet points
- **Docker Support**: Easy deployment with Docker and Docker Compose

## Project Structure

```
open_ai/
├── .env                    # Environment variables (API key)
├── .env.example           # Example environment file
├── server.py               # FastAPI backend server
├── templates/
│   └── index.html         # Web frontend
├── requirements.txt        # Python dependencies
├── Dockerfile             # Docker configuration
├── docker-compose.yml     # Docker Compose configuration
├── setup.sh               # Setup script for Mac/Linux
├── setup.bat              # Setup script for Windows
└── README.md              # This file
```

## Quick Start

**Prerequisites:** Docker installed

### Run directly from Docker Hub

```bash
docker run -d \
  -p 8000:8000 \
  -e OPENAI_API_TOKEN=your-api-key-here \
  --name text-summary-bot \
  analyzeagency/text-summary-openai:first_build

# Access the application
open http://localhost:8000
```

### Run with custom port

```bash
docker run -d \
  -p 3000:8000 \
  -e OPENAI_API_TOKEN=your-api-key-here \
  --name text-summary-bot \
  analyzeagency/text-summary-openai:first_build

# Access at http://localhost:3000
```

### Useful Commands

```bash
# Stop the application
docker stop text-summary-bot

# View logs
docker logs -f text-summary-bot

# Remove container
docker rm text-summary-bot

# Restart the application
docker restart text-summary-bot
```
