#!/bin/bash

mkdir -p $HOME/.local/share/application/
mkdir -p $HOME/.local/share/youtube-music/icons/

cp setup/icons/music.png /home/$USER/.local/share/youtube-music/icons/music.png

cat <<EOF >$HOME/.local/share/applications/chrome-music.youtube.com__-Default.desktop
[Desktop Entry]
Version=1.0
Name=YouTube Music
Comment=YouTube Music
Exec=google-chrome --app="https://music.youtube.com" --class=YouTubeMusic
Terminal=false
Type=Application
Icon=/home/$USER/.local/share/youtube-music/icons/music.png
Categories=GTK;
StartupNotify=true
StartupWMClass=google-chrome
EOF
