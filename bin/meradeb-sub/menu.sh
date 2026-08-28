#!/bin/bash

if [ $# -eq 0 ]; then
  SUB=$(gum choose "Theme" "Background" "Font" "Hotkeys" "Manual" "Quit" --height 10 --header "" | tr '[:upper:]' '[:lower:]')
else
  SUB=$1
fi

source $MERADEB_PATH/bin/meradeb-sub/header.sh
[ -n "$SUB" ] && [ "$SUB" != "quit" ] && source $MERADEB_PATH/bin/meradeb-sub/$SUB.sh
