FROM python:3.10-slim

ENV PYTHONUNBUFFERED=1
WORKDIR /app

# Install System
RUN apt-get update && apt-get install -y git wget build-essential && rm -rf /var/lib/apt/lists/*

# Install Torch CPU
RUN pip install torch --index-url https://download.pytorch.org/whl/cpu

# Install Llama-cpp (Latest)
RUN pip install llama-cpp-python --extra-index-url https://abetlen.github.io/llama-cpp-python/whl/cpu

# Install Library Lain
RUN pip install numpy gradio huggingface-hub python-multipart chromadb transformers sentence-transformers langchain-core langchain-community langchain-huggingface langchain-chroma langchain-sentence-transformers sentencepiece pillow uvicorn fastapi
