#!/bin/bash

# === Konfiguration ===
# YouTube Stream URL (ersetzen!)
YOUTUBE_URL="https://www.youtube.com/watch?v=xf9Ejt4OmWQ"

# Caster.FM Daten (ersetzen!)
CASTER_HOST="sapircast.caster.fm"
CASTER_PORT="18560"
CASTER_PASSWORD="VXpoCYCQWT"
CASTER_MOUNT="/9OzKK"   # manchmal / oder /stream – hängt von deinem Account ab

# === Stream starten ===
ffmpeg -re -i "$YOUTUBE_URL" \
  -vn -acodec libmp3lame -ar 44100 -b:a 128k \
  -content_type audio/mpeg \
  -f mp3 "icecast://source:${CASTER_PASSWORD}@${CASTER_HOST}:${CASTER_PORT}${CASTER_MOUNT}"
