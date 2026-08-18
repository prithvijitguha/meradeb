#!/bin/bash

cat <<EOF >"$HOME/.local/share/applications/Omakub.desktop"
[Desktop Entry]
Version=1.0
Name=Omakub
Comment=Omakub Controls
Exec=ghostty --class=Omakub --title=Omakub -e omadeb
Terminal=false
Type=Application
Icon=$HOME/.local/share/omadeb/applications/icons/Omadeb.png
Categories=GTK;
StartupNotify=false
EOF
