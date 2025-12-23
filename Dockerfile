RUN pip install --upgrade pip

RUN pip install --no-cache-dir torch transformers sentence-transformers sentencepiece

RUN pip install --no-cache-dir chromadb langchain-chroma
RUN pip install --no-cache-dir langchain-core langchain-community langchain-huggingface langchain-sentence-transformers
RUN pip install --no-cache-dir numpy gradio huggingface-hub python-multipart pillow uvicorn fastapi
