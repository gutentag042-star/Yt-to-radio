# Basis-Image
FROM alpine:latest

# ffmpeg, python3, pip und curl installieren
RUN apk add --no-cache ffmpeg python3 py3-pip bash curl

# yt-dlp installieren
RUN pip install yt-dlp

# Arbeitsverzeichnis
WORKDIR /app

# stream.sh ins Image kopieren
COPY stream.sh /app/stream.sh
RUN chmod +x /app/stream.sh

# Start Command
CMD ["/bin/bash", "/app/stream.sh"]
