#!/bin/bash

cat <<EOF >~/.local/share/applications/Youtube-music.desktop
[Desktop Entry]
Version=1.0
Name=YouTube Music
Comment=YouTube Music
Exec=chromium --app="https://music.youtube.com" --class=YouTubeMusic
Terminal=false
Type=Application
Icon=$HOME/.local/share/meradeb/applications/icons/Music.png
Categories=GTK;
StartupNotify=true
StartupWMClass=music.youtube.com
EOF
