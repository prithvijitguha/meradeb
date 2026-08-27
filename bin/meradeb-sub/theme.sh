#!/bin/bash

THEME_NAMES=("Tokyo Night" "Catppuccin" "Catppuccin Custom" "Nord" "Everforest" "Gruvbox" "Kanagawa" "Ristretto" "Rose Pine" "Matte Black" "Osaka Jade")
THEME=$(gum choose "${THEME_NAMES[@]}" "<< Back" --header "Choose your theme" --height 12 | tr '[:upper:]' '[:lower:]' | sed 's/ /-/g')

if [ -n "$THEME" ] && [ "$THEME" != "<<-back" ]; then
  if [ -d "$HOME/.config/nvim" ]; then
    cp $MERADEB_PATH/themes/$THEME/neovim.lua ~/.config/nvim/lua/plugins/theme.lua
  fi

  source $MERADEB_PATH/themes/$THEME/gnome.sh
fi

source $MERADEB_PATH/bin/meradeb-sub/menu.sh
