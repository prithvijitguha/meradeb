#!/bin/bash

cat <<EOF >~/.local/share/applications/chrome-music.youtube.com__-Default.desktop
[Desktop Entry]
Version=1.0
Name=YouTube Music
Comment=YouTube Music
Exec=google-chrome --app="https://music.youtube.com" --class=YouTubeMusic
Terminal=false
Type=Application
Icon=music
Categories=GTK;
StartupNotify=true
StartupWMClass=google-chrome
EOF
