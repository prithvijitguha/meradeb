#!/bin/bash

set -e

ascii_art='
 ██████╗ ███╗   ███╗ █████╗ ██████╗ ███████╗██████╗ ██╗ █████╗ ███╗   ██╗
██╔═══██╗████╗ ████║██╔══██╗██╔══██╗██╔════╝██╔══██╗██║██╔══██╗████╗  ██║
██║   ██║██╔████╔██║███████║██║  ██║█████╗  ██████╔╝██║███████║██╔██╗ ██║
██║   ██║██║╚██╔╝██║██╔══██║██║  ██║██╔══╝  ██╔══██╗██║██╔══██║██║╚██╗██║
╚██████╔╝██║ ╚═╝ ██║██║  ██║██████╔╝███████╗██████╔╝██║██║  ██║██║ ╚████║
 ╚═════╝ ╚═╝     ╚═╝╚═╝  ╚═╝╚═════╝ ╚══════╝╚═════╝ ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝
'

echo -e "$ascii_art"
echo "=> Omadeb is recommended and tested on Debian 13 installations only!"
echo -e "\nBegin installation (or abort with ctrl+c)..."

sudo apt-get update >/dev/null
sudo apt-get install -y git >/dev/null

echo "Cloning Omadeb..."
rm -rf ~/.local/share/meradeb
git clone git@github.com:prithvijitguha/meradeb.git ~/.local/share/meradeb >/dev/null
if [[ $OMADEB_REF != "master" ]]; then
  cd ~/.local/share/meradeb
  git fetch origin "${OMADEB_REF:-stable}" && git checkout "${OMADEB_REF:-stable}"
  cd -
fi

echo "Installation starting..."
source ~/.local/share/meradeb/install.sh
