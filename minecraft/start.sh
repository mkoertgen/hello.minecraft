#!/bin/sh
# -----------------------------------------------------------------------------
# docker-minecraft /start script
# -----------------------------------------------------------------------------
if [ ! -f minecraft_server.jar ]
then
  echo "Downloading minecraft server ${MC_VER} ..." && \
  curl -fsSL https://launchermeta.mojang.com/mc/game/version_manifest.json \
  | jq -r ".versions[] | select(.id == \"$MC_VER\") | .url" \
  | xargs curl -fsSL \
  | jq -r ".downloads.server.url" \
  | xargs curl -fsSL -o minecraft_server.jar
fi

if [ ! -f eula.txt ]
then
  echo "Accepting EULA..." && \
  echo "eula=true" > eula.txt
fi

java "-Xms$INIT_MEM" "-Xmx$MAX_MEM" -jar minecraft_server.jar nogui
