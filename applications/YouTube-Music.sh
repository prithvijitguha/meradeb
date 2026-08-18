#!/bin/bash

cat <<EOF >~/.local/share/applications/firefox-youtube-music.desktop
[Desktop Entry]
Version=1.0
Name=YouTube Music
Comment=YouTube Music
Exec=firefox --new-window "https://music.youtube.com"
Terminal=false
Type=Application
Icon=$HOME/.local/share/omadeb/applications/icons/Music.png
Categories=GTK;
StartupNotify=true
StartupWMClass=firefox
EOF
