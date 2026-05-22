# Free Claude Code - Docker Image
# Updated: 2026-05-22 to force Railway rebuild
FROM python:3.14-slim

# Sistem bağımlılıkları
RUN apt-get update && apt-get install -y \
    gcc \
    g++ \
    && rm -rf /var/lib/apt/lists/*

# Çalışma dizini
WORKDIR /app

# Python bağımlılıkları
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Tüm dosyaları kopyala
COPY . .

# Debug: Dosyaların kopyalandığını kontrol et
RUN ls -la /app && echo "=== server.py exists? ===" && ls -la /app/server.py

# Port (Railway sets this dynamically)
EXPOSE 8082

# Başlatma komutu - Python script reads PORT from environment
CMD ["python", "server.py"]
