#!/bin/bash
sudo apt update -y
sudo apt upgrade -y

# Then install all other files
sudo apt install -y $(cat ~/.local/share/omadeb/install/omadebian-base-packages.txt)
# Run terminal installers
for installer in ~/.local/share/omadeb/install/terminal/*.sh; do source $installer; done
