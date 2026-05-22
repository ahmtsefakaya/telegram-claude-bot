# Free Claude Code - Docker Image
FROM python:3.14-slim

# Sistem bağımlılıkları
RUN apt-get update && apt-get install -y \
    gcc \
    g++ \
    && rm -rf /var/lib/apt/lists/*

# Uygulama dosyalarını root'a kopyala
COPY requirements.txt /requirements.txt
RUN pip install --no-cache-dir -r /requirements.txt

# Tüm dosyaları kopyala
COPY . /app
WORKDIR /app

# Port (Railway sets this dynamically)
EXPOSE 8082

# Başlatma komutu - Python script reads PORT from environment
CMD ["python", "/app/server.py"]
