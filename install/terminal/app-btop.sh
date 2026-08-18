#!/bin/bash

# This script installs btop, a resource monitor that shows usage and stats for processor, memory, disks, network and processes.
if ! command -v btop >/dev/null 2>&1; then
  sudo apt install -y btop

  # Use omadeb btop config
  mkdir -p ~/.config/btop/themes
  cp ~/.local/share/omadeb/configs/btop.conf ~/.config/btop/btop.conf
  cp ~/.local/share/omadeb/themes/tokyo-night/btop.theme ~/.config/btop/themes/tokyo-night.theme
fi
