# Free Claude Code - Docker Image
FROM python:3.14-slim

# Çalışma dizini
WORKDIR /app

# Sistem bağımlılıkları
RUN apt-get update && apt-get install -y \
    gcc \
    g++ \
    && rm -rf /var/lib/apt/lists/*

# Python bağımlılıkları
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Uygulama dosyaları
COPY . .

# Port
EXPOSE 8080

# Healthcheck
HEALTHCHECK --interval=30s --timeout=10s --start-period=40s --retries=3 \
  CMD python -c "import httpx; httpx.get('http://localhost:8080/health', timeout=5.0)"

# Başlatma komutu
CMD ["uvicorn", "server:app", "--host", "0.0.0.0", "--port", "8080", "--timeout-graceful-shutdown", "5"]
