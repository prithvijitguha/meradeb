#!/bin/bash

if ! command -v wofi >/dev/null 2>&1; then
  rm -rf /tmp/wofi
  git clone --depth 1 https://github.com/SimplyCEO/wofi.git /tmp/wofi
  cd /tmp/wofi
  meson setup build
  ninja -C build
  su -c "ninja -C build install"

  # Added tmux configs
  cp -r ~/.local/share/omadeb/configs/wofi/ ~/.config/
fi
