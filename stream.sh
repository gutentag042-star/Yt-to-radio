#!/bin/bash

# === Konfiguration ===
# YouTube Stream URL (ersetzen!)
YOUTUBE_URL="https://www.youtube.com/watch?v=DEINE_STREAM_ID"

# Caster.FM Daten (ersetzen!)
CASTER_HOST="x.yourcasterserver.caster.fm"
CASTER_PORT="12345"
CASTER_PASSWORD="deinpasswort"
CASTER_MOUNT="/live"   # manchmal / oder /stream – hängt von deinem Account ab

# === Stream starten ===
ffmpeg -re -i "$YOUTUBE_URL" \
  -vn -acodec libmp3lame -ar 44100 -b:a 128k \
  -content_type audio/mpeg \
  -f mp3 "icecast://source:${CASTER_PASSWORD}@${CASTER_HOST}:${CASTER_PORT}${CASTER_MOUNT}"
