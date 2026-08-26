#!/bin/bash

choice=$(gum choose {7..14} "<< Back" --height 11 --header "Choose your terminal font size")

if [[ $choice =~ ^[0-9]+$ ]]; then
  source $MERADEB_PATH/bin/meradeb-sub/font-size.sh
else
  source $MERADEB_PATH/bin/meradeb-sub/font.sh
fi
