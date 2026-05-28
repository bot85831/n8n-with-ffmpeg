# add ffmpeg to n8n image
FROM alpine:3.22 AS ffmpeg-source

RUN apk add --no-cache ffmpeg

# copy ffmpeg and ffprobe to n8n image
FROM n8nio/n8n:latest

USER root

COPY --from=ffmpeg-source /usr/bin/ffmpeg /usr/bin/ffmpeg
COPY --from=ffmpeg-source /usr/bin/ffprobe /usr/bin/ffprobe
COPY --from=ffmpeg-source /usr/lib/ /usr/lib/

USER node
