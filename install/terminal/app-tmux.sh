#!/bin/bash

if ! command -v tmux >/dev/null 2>&1; then
  sudo apt install -y tmux
  # Added tmux configs
  cp ~/.local/share/omadeb/configs/.tmux.conf ~/.tmux.conf
fi
