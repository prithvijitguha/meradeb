#!/bin/bash
sudo apt update -y
sudo apt upgrade -y
sudo apt install -y

# Then install all other files
$(cat pkglist)
# Run terminal installers
for installer in ~/.local/share/omadeb/install/terminal/*.sh; do source $installer; done
