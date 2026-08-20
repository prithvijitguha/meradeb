#!/bin/bash

cat <<EOF >"$HOME/.local/share/applications/Omadebian.desktop"
[Desktop Entry]
Version=1.0
Name=Omadebian
Comment=Omadebian Controls
Exec=ghostty --class=Omadeb --title=Omadebian -e omadeb'
Terminal=false
Type=Application
Icon=$HOME/.local/share/omadeb/applications/icons/Omadeb.png
Categories=GTK;
StartupNotify=false
EOF
