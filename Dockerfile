FROM python:3.9-slim

WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Upgrade pip
RUN pip install --no-cache-dir --upgrade pip

# Install Machine Learning Core
RUN pip install --no-cache-dir torch transformers sentence-transformers sentencepiece

# Install Vector Database
RUN pip install --no-cache-dir chromadb langchain-chroma

# Install LangChain Ecosystem
RUN pip install --no-cache-dir langchain-core langchain-community langchain-huggingface langchain-sentence-transformers

# Install Web Server & Utilities
RUN pip install --no-cache-dir numpy gradio huggingface-hub python-multipart pillow uvicorn fastapi

# Copy application files
COPY . .

# Set permissions
RUN chmod -R 777 /app

# Expose port
EXPOSE 7860

# Command to run the application
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "7860"]
