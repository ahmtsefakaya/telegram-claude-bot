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

# Port (Railway sets this dynamically)
EXPOSE 8082

# Başlatma komutu - Python script reads PORT from environment
CMD ["python", "server.py"]
