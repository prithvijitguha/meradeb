#!/bin/bash

MERADEB_THEME_COLOR="blue"
MERADEB_THEME_BACKGROUND="nord.png"
source $MERADEB_PATH/themes/set-gnome-theme.sh
gsettings set org.gnome.shell.extensions.tilingshell window-border-color "#208fe9"
