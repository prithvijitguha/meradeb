#!/bin/bash

MERADEB_THEME_COLOR="purple"
MERADEB_THEME_BACKGROUND="kanagawa.jpg"
source $MERADEB_PATH/themes/set-gnome-theme.sh
gsettings set org.gnome.shell.extensions.tilingshell window-border-color "#924d8b"
