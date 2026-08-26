#!/bin/bash

if ! command -v ghostty >/dev/null 2>&1; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/mkasberg/ghostty-ubuntu/HEAD/install.sh)"
fi

cp ~/.local/share/meradeb/configs/ghostty/config ~/.config/ghostty/config
