#!/bin/bash

THEME_NAMES=("Tokyo Night" "Catppuccin" "Catppuccin Custom" "Nord" "Everforest" "Gruvbox" "Kanagawa" "Ristretto" "Rose Pine" "Matte Black" "Osaka Jade")
THEME=$(gum choose "${THEME_NAMES[@]}" "<< Back" --header "Choose your theme" --height 12 | tr '[:upper:]' '[:lower:]' | sed 's/ /-/g')

if [ -n "$THEME" ] && [ "$THEME" != "<<-back" ]; then
  if [ -d "$HOME/.config/nvim" ]; then
    cp $MERADEB_PATH/themes/$THEME/neovim.lua ~/.config/nvim/lua/plugins/theme.lua
  fi

  if [ -f "$MERADEB_PATH/themes/$THEME/btop.theme" ]; then
    cp $MERADEB_PATH/themes/$THEME/btop.theme ~/.config/btop/themes/$THEME.theme
    sed -i "s/color_theme = \".*\"/color_theme = \"$THEME\"/g" ~/.config/btop/btop.conf
  else
    sed -i "s/color_theme = \".*\"/color_theme = \"Default\"/g" ~/.config/btop/btop.conf
  fi
  source $MERADEB_PATH/themes/$THEME/gnome.sh
  source $MERADEB_PATH/themes/$THEME/tophat.sh

  # For ghostty
  if ghostty +list-themes | grep -Fxq "$THEME"; then
    sed -i "s/^theme = .*/theme = $THEME/" ~/.config/ghostty/config
  fi
fi

source $MERADEB_PATH/bin/meradeb-sub/menu.sh
