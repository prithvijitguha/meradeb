#!/bin/bash

gum log --structured --level info "Installing all terminal packages"
source ~/.local/share/meradeb/install/install-base-packages.sh
source ~/.local/share/meradeb/install/terminal/app-chezmoi.sh
source ~/.local/share/meradeb/install/terminal/app-neovim.sh
source ~/.local/share/meradeb/install/terminal/app-cli-tools.sh
source ~/.local/share/meradeb/install/terminal/app-fastfetch.sh
source ~/.local/share/meradeb/install/terminal/app-omz.sh
source ~/.local/share/meradeb/install/terminal/set-default-configs.sh
source ~/.local/share/meradeb/install/terminal/install-flatpak-packages.sh
