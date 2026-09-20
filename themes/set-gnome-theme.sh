#!/bin/bash

gum log --structured --level info "Installing Gnome theme $THEME"

BACKGROUND_DEST_DIR="$HOME/.local/share/backgrounds"

mkdir -p $BACKGROUND_DEST_DIR

set_background() {
  local background="$1"
  local name
  local dest

  name=$(basename "$background")
  dest="$BACKGROUND_DEST_DIR/$name"

  [ -f "$dest" ] || cp "$background" "$dest"
  # Clear first so a "changed" signal always fires, even for the same wallpaper
  gsettings reset org.gnome.desktop.background picture-uri
  gsettings reset org.gnome.desktop.background picture-uri-dark

  gsettings set org.gnome.desktop.background picture-uri "file://$dest"
  gsettings set org.gnome.desktop.background picture-uri-dark "file://$dest"
  gsettings set org.gnome.desktop.background picture-options 'zoom'
}

set_background "$WALLPAPER_PATH"

# GNOME
# This also sets the MERADEB_THEME_COLOR variable
if [ -f "$WALLPAPER_DIR/gnome.sh" ]; then
  source "$WALLPAPER_DIR/gnome.sh"
fi
