#!/bin/bash

# Text Summarization Bot - Setup Script
# This script sets up and runs the application

echo "========================================="
echo "Text Summarization Bot - Setup"
echo "========================================="
echo ""

# Check if Python is installed
if ! command -v python3 &> /dev/null; then
    echo "[ERROR] Python 3 is not installed. Please install Python 3.8 or higher."
    exit 1
fi

echo "[OK] Python 3 found: $(python3 --version)"
echo ""

# Check if .env file exists
if [ ! -f .env ]; then
    echo "[WARNING] .env file not found. Creating one now..."
    echo ""
    echo "Please enter your OpenAI API key:"
    read -r api_key
    echo "OPENAI_API_TOKEN=$api_key" > .env
    echo "[OK] .env file created"
    echo ""
else
    echo "[OK] .env file already exists"
    echo ""
fi

# Create virtual environment if it doesn't exist
if [ ! -d "venv" ]; then
    echo "Creating virtual environment..."
    python3 -m venv venv
    echo "[OK] Virtual environment created"
    echo ""
else
    echo "[OK] Virtual environment already exists"
    echo ""
fi

# Activate virtual environment
echo "Activating virtual environment..."
source venv/bin/activate

# Upgrade pip
echo "Upgrading pip..."
pip install --upgrade pip --quiet

# Install dependencies
echo "Installing dependencies..."
pip install -r requirements.txt --quiet

if [ $? -eq 0 ]; then
    echo "[OK] Dependencies installed successfully"
    echo ""
else
    echo "[ERROR] Failed to install dependencies"
    exit 1
fi

# Create templates directory if it doesn't exist
if [ ! -d "templates" ]; then
    echo "[ERROR] Templates directory not found"
    echo "Please ensure templates/index.html exists"
    exit 1
fi

echo "========================================="
echo "Setup Complete!"
echo "========================================="
echo ""
echo "Starting the server..."
echo "The application will be available at: http://localhost:8000"
echo ""
echo "Press Ctrl+C to stop the server"
echo ""

# Start the server
python server.py
