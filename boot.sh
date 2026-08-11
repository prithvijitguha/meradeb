#!/bin/bash

set -e

ascii_art='________                  __        ___.
\_____  \   _____ _____  |  | ____ _\_ |__
 /   |   \ /     \\__   \ |  |/ /  |  \ __ \
/    |    \  Y Y  \/ __ \|    <|  |  / \_\ \
\_______  /__|_|  (____  /__|_ \____/|___  /
        \/      \/     \/     \/         \/
'

echo -e "$ascii_art"
echo "=> Omadeb is for fresh Debian 13 installations only!"
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
