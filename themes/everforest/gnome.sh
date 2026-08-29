#!/bin/bash

MERADEB_THEME_COLOR="bark"
MERADEB_THEME_BACKGROUND="everforest.jpg"
source $MERADEB_PATH/themes/set-gnome-theme.sh
# Set the gnome shell setting color
gsettings set org.gnome.shell.extensions.tilingshell window-border-color "#78ab50"
