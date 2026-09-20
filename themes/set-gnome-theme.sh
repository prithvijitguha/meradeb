#!/bin/bash

gum log --structured --level info "Installing Gnome theme $THEME"

# COLORS="$WALLPAPER_DIR/colors.toml"

# get_color() {
#   sed -n "s/^$1 = \"\\(#[0-9a-fA-F]*\\)\"$/\1/p" "$COLORS"
# }
BACKGROUND_DEST_DIR="$HOME/.local/share/backgrounds"

mkdir -p $BACKGROUND_DEST_DIR

set_background() {
  local background="$1"
  local name
  local dest

  name=$(basename "$background")
  dest="$BACKGROUND_DEST_DIR/$name"

  [ -f "$dest" ] || cp "$background" "$dest"

  gsettings set org.gnome.desktop.background picture-uri "$dest"
  gsettings set org.gnome.desktop.background picture-uri-dark "$dest"
  gsettings set org.gnome.desktop.background picture-options 'zoom'
}

set_background "$WALLPAPER_PATH"

# GNOME
# This also sets the MERADEB_THEME_COLOR variable
if [ -f "$WALLPAPER_DIR/gnome.sh" ]; then
  source "$WALLPAPER_DIR/gnome.sh"
fi

# gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
# gsettings set org.gnome.desktop.interface cursor-theme 'Yaru'
# gsettings set org.gnome.desktop.interface gtk-theme "Yaru-$MERADEB_THEME_COLOR-dark"
# gsettings set org.gnome.desktop.interface icon-theme "Yaru-$MERADEB_THEME_COLOR"
# gsettings set org.gnome.desktop.interface accent-color "$MERADEB_THEME_COLOR"

# Tophat
# gsettings set org.gnome.shell.extensions.tophat meter-fg-color "$(get_color accent)"
