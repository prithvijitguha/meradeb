#!/bin/bash
sudo apt update -y
sudo apt upgrade -y

# Then install all other files
echo "Installing following base packages"
echo "$(cat ~/.local/share/meradeb/install/meradebian-base-packages.txt)"
sudo apt install -y $(cat ~/.local/share/meradeb/install/meradebian-base-packages.txt)
# Run terminal installers
for installer in ~/.local/share/meradeb/install/terminal/*.sh; do source $installer; done
