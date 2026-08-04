#!/bin/sh
set -e

# Replace UUID placeholder
if [ -n "$UUID" ]; then
    sed -i "s/PASTE_YOUR_UUID_HERE/$UUID/g" /app/config.json
fi

# Start Cloudflare Tunnel if token provided
if [ -n "$ARGO_TOKEN" ]; then
    cloudflared tunnel --no-autoupdate run --token "$ARGO_TOKEN" &
fi

# Start sing-box
exec sing-box run -c /app/config.json
