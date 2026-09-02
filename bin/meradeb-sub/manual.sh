#!/bin/bash

cd "$MERADEB_PATH" || exit 1

mkdocs serve \
  --dev-addr 127.0.0.1:8000 \
  >/dev/null 2>&1 &

chromium \
  --app="http://127.0.0.1:8000/" \
  --name=Manual \
  --class=Manual \
  &>/dev/null &

# Get the manual PID
CHROMIUM_PID=$!
# Wait while it runs in background
wait "$CHROMIUM_PID"

# Kill it once closed, the reason is that otherwise we can't develop
# docs with it
kill "$MKDOCS_PID" 2>/dev/null
wait "$MKDOCS_PID" 2>/dev/null
source "$MERADEB_PATH/bin/meradeb-sub/menu.sh"
