#!/bin/bash

cat <<EOF >"$HOME/.local/share/applications/Meradeb.desktop"
[Desktop Entry]
Version=1.0
Name=Omadebian
Comment=Omadebian Controls
Exec=ghostty --class=Meradeb --title=Meradeb -e zsh -lic 'export MERADEB_PATH="$HOME/.local/share/meradeb"; export PATH="$HOME/.local/share/meradeb/bin:$HOME/.local/bin:$PATH"; meradeb'
Terminal=false
Type=Application
Icon=$HOME/.local/share/meradeb/applications/icons/Omadeb.png
Categories=GTK;
StartupNotify=false
EOF
