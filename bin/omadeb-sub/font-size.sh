#!/bin/bash

choice=$(gum choose {7..14} "<< Back" --height 11 --header "Choose your terminal font size")

if [[ $choice =~ ^[0-9]+$ ]]; then
  source $OMADEB_PATH/bin/omadeb-sub/font-size.sh
else
  source $OMADEB_PATH/bin/omadeb-sub/font.sh
fi
