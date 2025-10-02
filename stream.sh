```bash
#!/bin/bash

YouTube URL als Umgebungsvariable
YOUTUBE_URL="YOUTUBE_URL"

Caster.fm Infos (aus deinem Bild)
ICECAST_USER="source"
ICECAST_PASS="VXpaCYCWQ"
ICECAST_HOST="sapircast.caster.fm"
ICECAST_PORT="18560"
ICECAST_MOUNT="9OzKK"

Starte Stream
yt-dlp -o - -f bestaudio "YOUTUBE_URL" | ffmpeg -i - -vn -c:a libmp3lame -b:a 96k -f mp3 \
"icecast://ICECAST_USER:ICECAST_PASS@ICECAST_HOST:ICECAST_PORT/$ICECAST_MOUNT"
```
