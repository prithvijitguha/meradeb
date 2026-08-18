#!/bin/bash

set -e

ascii_art='________                      .___    ___.    
\_____  \   _____ _____     __| _/____\_ |__  
 /   |   \ /     \\__  \   / __ |/ __ \| __ \ 
/    |    \  Y Y  \/ __ \_/ /_/ \  ___/| \_\ \
\_______  /__|_|  (____  /\____ |\___  >___  /
        \/      \/     \/      \/    \/    \/ '

echo -e "$ascii_art"
echo "=> Omadeb is recommended and tested on Debian 13 installations only!"
echo -e "\nBegin installation (or abort with ctrl+c)..."

sudo apt-get update >/dev/null
sudo apt-get install -y git >/dev/null

echo "Cloning Omadeb..."
rm -rf ~/.local/share/omadeb
git clone git@github.com:prithvijitguha/omadeb.git ~/.local/share/omadeb >/dev/null
if [[ $OMADEB_REF != "master" ]]; then
  cd ~/.local/share/omadeb
  git fetch origin "${OMADEB_REF:-stable}" && git checkout "${OMADEB_REF:-stable}"
  cd -
fi

echo "Installation starting..."
source ~/.local/share/omadeb/install.sh
