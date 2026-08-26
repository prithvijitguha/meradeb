#!/bin/bash

BACKGROUND_NAMES=(
  $(find "$MERADEB_PATH/themes" -type f \( -iname "*.jpg" -o -iname "*.png" \) -printf '%f\n')
)

BACKGROUND=$(gum choose "${BACKGROUND_NAMES[@]}" "<< Back" --header "Choose your background" --height 12)
if [ "$BACKGROUND" = "<< Back" ]; then
  exit 0
fi

MERADEB_THEME_BACKGROUND="$BACKGROUND"

BACKGROUND_ORG_PATH="$HOME/.local/share/meradeb/themes/background/$MERADEB_THEME_BACKGROUND"
BACKGROUND_DEST_DIR="$HOME/.local/share/backgrounds"
BACKGROUND_DEST_PATH="$BACKGROUND_DEST_DIR/$(echo "$MERADEB_THEME_BACKGROUND" | tr '/' '-')"

if [ ! -d "$BACKGROUND_DEST_DIR" ]; then
  mkdir -p "$BACKGROUND_DEST_DIR"
fi

[ ! -f "$BACKGROUND_DEST_PATH" ] && cp "$BACKGROUND_ORG_PATH" "$BACKGROUND_DEST_PATH"

gsettings set org.gnome.desktop.background picture-uri "$BACKGROUND_DEST_PATH"
gsettings set org.gnome.desktop.background picture-uri-dark "$BACKGROUND_DEST_PATH"
gsettings set org.gnome.desktop.background picture-options 'zoom'

source $MERADEB_PATH/bin/meradeb-sub/menu.sh
