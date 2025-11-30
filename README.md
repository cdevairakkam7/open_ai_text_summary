# Text Summarization Bot

A web-based text summarization application powered by OpenAI's GPT-4o-mini model. This application provides both a command-line interface and a beautiful web interface for summarizing long texts into concise bullet points.

**Mac/Linux:**
```bash
git clone <your-repo-url>
cd open_ai
./setup.sh
```

**Windows:**
```bash
git clone <your-repo-url>
cd open_ai
setup.bat
```

## Project Structure

```
open_ai/
├── .env                    # Environment variables (API key)
├── main.py                 # CLI interface with multi-turn conversation
├── server.py               # FastAPI backend server
├── templates/
│   └── index.html         # Web frontend
├── requirements.txt        # Python dependencies
└── README.md              # This file
```
