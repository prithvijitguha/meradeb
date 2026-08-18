#!/bin/bash

OMADEB_THEME_COLOR="red"
OMADEB_THEME_BACKGROUND="rose-pine.jpg"
source $OMADEB_PATH/themes/set-gnome-theme.sh
gsettings set org.gnome.desktop.interface color-scheme 'prefer-light'
