#!/bin/bash
sudo apt update -y
sudo apt upgrade -y
sudo apt install -y curl git unzip build-essential meson ninja-build pkg-config firefox-esr rustup bat tmux fzf ripgrep bat eza zoxide plocate apache2-utils fd-find
# Run terminal installers
for installer in ~/.local/share/omadeb/install/terminal/*.sh; do source $installer; done
