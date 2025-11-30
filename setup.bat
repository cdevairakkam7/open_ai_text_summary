@echo off
REM Text Summarization Bot - Setup Script for Windows
REM This script sets up and runs the application

echo =========================================
echo Text Summarization Bot - Setup
echo =========================================
echo.

REM Check if Python is installed
python --version >nul 2>&1
if %errorlevel% neq 0 (
    echo X Python is not installed. Please install Python 3.8 or higher.
    pause
    exit /b 1
)

echo + Python found
python --version
echo.

REM Check if .env file exists
if not exist .env (
    echo Warning: .env file not found. Creating one now...
    echo.
    set /p api_key="Please enter your OpenAI API key: "
    echo OPENAI_API_TOKEN=%api_key%> .env
    echo + .env file created
    echo.
) else (
    echo + .env file already exists
    echo.
)

REM Create virtual environment if it doesn't exist
if not exist venv (
    echo Creating virtual environment...
    python -m venv venv
    echo + Virtual environment created
    echo.
) else (
    echo + Virtual environment already exists
    echo.
)

REM Activate virtual environment
echo Activating virtual environment...
call venv\Scripts\activate.bat

REM Upgrade pip
echo Upgrading pip...
python -m pip install --upgrade pip --quiet

REM Install dependencies
echo Installing dependencies...
pip install -r requirements.txt --quiet

if %errorlevel% equ 0 (
    echo + Dependencies installed successfully
    echo.
) else (
    echo X Failed to install dependencies
    pause
    exit /b 1
)

REM Check if templates directory exists
if not exist templates (
    echo Warning: Templates directory not found
    echo Please ensure templates\index.html exists
    pause
    exit /b 1
)

echo =========================================
echo Setup Complete!
echo =========================================
echo.
echo Starting the server...
echo The application will be available at: http://localhost:8000
echo.
echo Press Ctrl+C to stop the server
echo.

REM Start the server
python server.py
