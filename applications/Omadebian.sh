#!/bin/bash

cat <<EOF >"$HOME/.local/share/applications/Omadebian.desktop"
[Desktop Entry]
Version=1.0
Name=Omadebian
Comment=Omadebian Controls
Exec=alacritty --config-file /home/$USER/.config/alacritty/pane.toml --class=Omadebian --title=Omadebian -e omadebian
Terminal=false
Type=Application
Icon=$HOME/.local/share/omadeb/applications/icons/Omadeb.png
Categories=GTK;
StartupNotify=false
EOF
