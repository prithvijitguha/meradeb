#!/bin/bash

MERADEB_THEME_COLOR="grey"
MERADEB_THEME_BACKGROUND="ristretto.jpg"
source $MERADEB_PATH/themes/set-gnome-theme.sh
gsettings set org.gnome.shell.extensions.tilingshell window-border-color "#2c2525"
