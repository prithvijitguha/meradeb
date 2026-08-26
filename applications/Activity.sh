#!/bin/bash

cat <<EOF >~/.local/share/applications/Activity.desktop
[Desktop Entry]
Version=1.0
Name=Activity
Comment=System activity from btop
Exec=env LANG=en_US.UTF-8 LC_CTYPE=en_US.UTF-8 ghostty --class=Activity --title=Activity -e btop
Terminal=false
Type=Application
Icon=/home/$USER/.local/share/meradeb/applications/icons/Activity.png
Categories=GTK;
StartupNotify=false
EOF
