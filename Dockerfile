# Telegram Claude Bot - Railway Deployment
# Build date: 2026-05-22
FROM python:3.14-slim

# Set working directory first
WORKDIR /app

# Install system dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends gcc g++ && \
    rm -rf /var/lib/apt/lists/*

# Copy and install Python dependencies
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

# Copy application files
COPY . ./

# Verify files are copied (debug)
RUN echo "=== Files in /app ===" && ls -la && \
    echo "=== Checking server.py ===" && \
    test -f server.py && echo "server.py exists!" || echo "ERROR: server.py NOT FOUND!"

# Create workspace directories
RUN mkdir -p /tmp/.fcc/agent_workspace && \
    mkdir -p /tmp/workspace && \
    chmod -R 777 /tmp/.fcc && \
    chmod -R 777 /tmp/workspace

# Expose port
EXPOSE 8082

# Start command
CMD ["python", "server.py"]
