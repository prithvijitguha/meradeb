#!/bin/bash

cat <<EOF >"$HOME/.local/share/applications/Omadebian.desktop"
[Desktop Entry]
Version=1.0
Name=Omadebian
Comment=Omadebian Controls
Exec=ghostty --class=Omadeb --title=Omadebian --window-width=800 --window-height=600 -e zsh -lic 'export OMADEB_PATH="$HOME/.local/share/omadeb"; export PATH="$HOME/.local/share/omadeb/bin:$HOME/.local/bin:$PATH"; omadeb'
Terminal=false
Type=Application
Icon=$HOME/.local/share/omadeb/applications/icons/Omadeb.png
Categories=GTK;
StartupNotify=false
EOF
