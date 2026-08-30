#!/bin/bash

MERADEB_THEME_COLOR="magenta"
MERADEB_THEME_BACKGROUND="catppuccin.png"
source $MERADEB_PATH/themes/set-gnome-theme.sh
gsettings set org.gnome.shell.extensions.tilingshell window-border-color "#e920a3"
