#!/bin/bash

choice=$(gum choose {7..14} "<< Back" --height 11 --header "Choose your terminal font size")

if [[ $choice =~ ^[0-9]+$ ]]; then
  # Update Ghostty font size
  sed -i "s/^font-size = .*/font-size = $choice/" ~/.config/ghostty/config
  source $MERADEB_PATH/bin/meradeb-sub/font-size.sh
else
  source $MERADEB_PATH/bin/meradeb-sub/font.sh
fi
