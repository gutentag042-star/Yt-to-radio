# Basis-Image mit ffmpeg
FROM alpine:latest

# ffmpeg, python3 und yt-dlp installieren
RUN apk add --no-cache ffmpeg python3 py3-pip bash curl \
    && pip install yt-dlp

# Arbeitsverzeichnis
WORKDIR /app

# stream.sh ins Image kopieren
COPY stream.sh /app/stream.sh

# Script ausführbar machen
RUN chmod +x /app/stream.sh

# Startbefehl
CMD ["./stream.sh"]
