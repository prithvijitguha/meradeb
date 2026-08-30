#!/bin/bash

MERADEB_THEME_COLOR="orange"
MERADEB_THEME_BACKGROUND="matte-black.jpg"
source $MERADEB_PATH/themes/set-gnome-theme.sh
gsettings set org.gnome.shell.extensions.tilingshell window-border-color "#FFFFFF"
