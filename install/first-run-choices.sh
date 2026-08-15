#!/bin/bash

# Only ask for default desktop app choices when running Gnome
if [[ "$XDG_CURRENT_DESKTOP" == *"GNOME"* ]]; then
  OPTIONAL_APPS=("Doom-emacs", "Zed", "Spotify", "Stremio", "Virtualbox", "Obsidian", "Retroarch", "Dropbox", "Mainline-kernels", "Windows", "Signal", "Xournalpp", "Gimp", "Discord", "Obs-studio", "Windsurf", "Xcompose", "Asdcontrol", "Alacritty", "Vscode", "1password", "Typora", "Minecraft", "Zoom", "Audacity", "Brave", "Pinta", "Rubymine", "Wl-clipboard", "Cursor")
  DEFAULT_OPTIONAL_APPS="Stremio,Steam,Signal"
  export omadeb_FIRST_RUN_OPTIONAL_APPS=$(gum choose "${OPTIONAL_APPS[@]}" --no-limit --selected $DEFAULT_OPTIONAL_APPS --height 7 --header "Select optional apps" | tr ' ' '-')
fi
