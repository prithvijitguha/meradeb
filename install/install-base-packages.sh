#!/bin/bash
sudo apt update -y
sudo apt upgrade -y

# Then install all other files
gum log --structured --level info "Installing following base packages"
gum log --structured --level info "$(cat ~/.local/share/meradeb/install/meradeb-base-packages.txt)"
sudo apt install -y $(cat ~/.local/share/meradeb/install/meradeb-base-packages.txt)
