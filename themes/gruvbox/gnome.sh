#!/bin/bash

MERADEB_THEME_COLOR="sage"
MERADEB_THEME_BACKGROUND="gruvbox.jpg"
source $MERADEB_PATH/themes/set-gnome-theme.sh
gsettings set org.gnome.shell.extensions.tilingshell window-border-color "#78ab50"
