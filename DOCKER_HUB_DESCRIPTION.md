# Text Summarization Bot

A web-based text summarization application powered by OpenAI's GPT-4o-mini model. This application provides a beautiful web interface for summarizing long texts into concise bullet points with configurable parameters.

## Features

- Beautiful, responsive chat interface
- Multi-turn conversations with conversation history
- Configurable temperature and max tokens
- Real-time text summarization
- Bullet point formatting

## Quick Start

### Run with default settings (port 8000)

```bash
docker run -d \
  -p 8000:8000 \
  -e OPENAI_API_TOKEN=your-api-key-here \
  --name text-summary-bot \
  analyzeagency/text-summary-openai:first_build
```

Access at: http://localhost:8000

### Run with custom port

```bash
docker run -d \
  -p 3000:8000 \
  -e OPENAI_API_TOKEN=your-api-key-here \
  --name text-summary-bot \
  analyzeagency/text-summary-openai:first_build
```

Access at: http://localhost:3000

## Required Environment Variables

- `OPENAI_API_TOKEN` - Your OpenAI API key (required)

## Optional Configuration

You can expose the container on any port by changing the `-p` flag:
- `-p 8000:8000` - Run on port 8000
- `-p 3000:8000` - Run on port 3000
- `-p 80:8000` - Run on port 80

## Docker Commands

```bash
# Stop the container
docker stop text-summary-bot

# View logs
docker logs -f text-summary-bot

# Restart the container
docker restart text-summary-bot

# Remove the container
docker rm text-summary-bot
```

## Get Your OpenAI API Key

1. Go to https://platform.openai.com/api-keys
2. Create a new API key
3. Add credits to your account at https://platform.openai.com/account/billing

## Source Code

GitHub: [Your GitHub Repository URL]

## Support

For issues and feature requests, please visit the GitHub repository.

## License

This project is for educational and personal use.
