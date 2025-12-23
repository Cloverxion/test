FROM python:3.10-slim

WORKDIR /app

RUN pip install --no-cache-dir --upgrade pip

RUN pip install --no-cache-dir torch --index-url https://download.pytorch.org/whl/cpu

RUN pip install --no-cache-dir --prefer-binary \
    transformers \
    sentence-transformers \
    sentencepiece \
    chromadb \
    langchain-chroma \
    langchain-core \
    langchain-community \
    langchain-huggingface \
    numpy \
    gradio \
    huggingface-hub \
    python-multipart \
    pillow \
    uvicorn \
    fastapi

COPY . .

RUN chmod -R 777 /app

EXPOSE 7860

CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "7860"]
