#!/bin/bash

cat <<EOF >"$HOME/.local/share/applications/Omadeb.desktop"
[Desktop Entry]
Version=1.0
Name=Omadeb
Comment=Omadeb Controls
Exec=ghostty --class=Omadeb --title=Omadeb -e zsh -lc 'omadeb'
Terminal=false
Type=Application
Icon=$HOME/.local/share/omadeb/applications/icons/Omadeb.png
Categories=GTK;
StartupNotify=false
EOF
