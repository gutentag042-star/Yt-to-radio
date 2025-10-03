#!/bin/bash

# === KONFIGURATION ===
YOUTUBE_URL="https://m.youtube.com/watch?v=xf9Ejt4OmWQ&pp=ygUMU3Bpbm5pbiAyNCA3"

# Caster.fm Zugangsdaten
CASTER_HOST="sapircast.caster.fm"
CASTER_PORT="18560"
CASTER_PASSWORD="VXpoCYCQWT"
MOUNTPOINT="/9OzKK"  # Caster.fm nutzt meist "/stream" als Mountpoint

# === STREAM STARTEN ===
yt-dlp -f bestaudio -o - "$YOUTUBE_URL" | ffmpeg -re -i - \
  -vn -acodec libmp3lame -b:a 128k -content_type audio/mpeg \
  -f mp3 "icecast://source:$CASTER_PASSWORD@$CASTER_HOST:$CASTER_PORT/$MOUNTPOINT"
