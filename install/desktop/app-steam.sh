#!/bin/bash

# Play games from https://store.steampowered.com/

if ! command -v google-chrome >/dev/null 2>&1; then
  sudo apt install mesa-vulkan-drivers libglx-mesa0:i386 mesa-vulkan-drivers:i386 libgl1-mesa-dri:i386
  sudo apt install steam-installer
fi
