#!/bin/bash

set -e

ascii_art='
███╗   ███╗███████╗██████╗  █████╗ ██████╗ ███████╗██████╗ 
████╗ ████║██╔════╝██╔══██╗██╔══██╗██╔══██╗██╔════╝██╔══██╗
██╔████╔██║█████╗  ██████╔╝███████║██║  ██║█████╗  ██████╔╝
██║╚██╔╝██║██╔══╝  ██╔══██╗██╔══██║██║  ██║██╔══╝  ██╔══██╗
██║ ╚═╝ ██║███████╗██║  ██║██║  ██║██████╔╝███████╗██████╔╝
╚═╝     ╚═╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝╚═════╝ ╚══════╝╚═════╝ 
'

echo -e "$ascii_art"
echo "=> Warning: Meradeb is recommeded for Debian 13 Trixie setups"
echo -e "\nBegin installation (or abort with ctrl+c)..."

sudo apt update && sudo apt install git

echo "Cloning Meradeb..."
rm -rf ~/.local/share/meradeb
git clone git@github.com:prithvijitguha/meradeb.git ~/.local/share/meradeb >/dev/null
if [[ $MERADEB_REF != "master" ]]; then
  cd ~/.local/share/meradeb
  git fetch origin "${MERADEB_REF:-stable}" && git checkout "${MERADEB_REF:-stable}"
  cd -
fi

echo "Installation starting..."
source ~/.local/share/meradeb/install.sh
