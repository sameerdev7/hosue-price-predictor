FROM python:3.11-slim

WORKDIR /app

# Copy requirements first for better caching
COPY src/api/requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy application code
COPY src/api/main.py .
COPY src/api/schemas.py .
COPY src/api/inference.py .

# Copy trained models
COPY models/trained/ models/trained/

EXPOSE 8000

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
