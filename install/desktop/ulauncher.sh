#!/bin/bash

wget -o "https://github.com/Ulauncher/Ulauncher/releases/download/5.15.15/ulauncher_5.15.15_all.deb"
sudo apt install ./ulauncher_5.15.15_all.deb -y
rm ulauncher_5.15.15_all.deb

# Start ulauncher to have it populate config before we overwrite
mkdir -p ~/.config/autostart/
cp ~/.local/share/omadeb/configs/ulauncher.desktop ~/.config/autostart/ulauncher.desktop
gtk-launch ulauncher.desktop >/dev/null 2>&1
sleep 2 # ensure enough time for ulauncher to set defaults
cp ~/.local/share/omadeb/configs/ulauncher.json ~/.config/ulauncher/settings.json
