# Use official Python runtime as base image
FROM python:3.11-slim

# Set working directory in container
WORKDIR /app

# Copy requirements first for better caching
COPY requirements.txt .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy application code
COPY server.py .
COPY templates/ templates/

# Expose port 8000
EXPOSE 8000

# Set environment variable (can be overridden)
ENV OPENAI_API_TOKEN=""

# Run the application
CMD ["python", "server.py"]
