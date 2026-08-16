#!/bin/bash

if command -v fastfetch >/dev/null 2>&1; then
  # Display system information in the terminal
  wget -o "https://github.com/fastfetch-cli/fastfetch/releases/download/2.67.1/fastfetch-linux-aarch64.deb"
  sudo apt install -y ./fastfetch-linux-aarch64.deb
  rm fastfetch-linux-aarch64.deb
fi

if [ ! -f "$HOME/.config/fastfetch/config.jsonc" ]; then
  # Use omadeb fastfetch config
  mkdir -p ~/.config/fastfetch
  cp ~/.local/share/omadeb/configs/fastfetch.jsonc ~/.config/fastfetch/config.jsonc
fi
