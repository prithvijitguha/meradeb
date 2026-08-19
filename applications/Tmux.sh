#!/bin/bash

cat <<EOF >~/.local/share/applications/Tmux.desktop
[Desktop Entry]
Version=1.0
Name=Tmux
Comment=Terminal multiplexer
Exec=ghostty --class=Tmux --title=Tmux -e tmux new -s main
Terminal=false
Type=Application
Icon=utilities-terminal
Categories=System;TerminalEmulator;
StartupNotify=false
EOF
