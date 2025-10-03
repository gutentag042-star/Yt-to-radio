# Basis: offizielles Python-Image
FROM python:3.11-slim

# ffmpeg installieren
RUN apt-get update && apt-get install -y ffmpeg curl bash && rm -rf /var/lib/apt/lists/*

# yt-dlp installieren
RUN pip install --no-cache-dir yt-dlp

# Arbeitsverzeichnis
WORKDIR /app

# stream.sh ins Image kopieren
COPY stream.sh /app/stream.sh
RUN chmod +x /app/stream.sh

# Start Command
CMD ["/bin/bash", "/app/stream.sh"]
