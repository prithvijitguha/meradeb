#!/bin/bash

gum log --structured --level info "Installing all applications"
gum log --structured --level info "$(ls ~/.local/share/meradeb/applications/*.sh | xargs -n 1 basename -s .sh | tr '\n' ' ')"
source ~/.local/share/meradeb/applications/About.sh
source ~/.local/share/meradeb/applications/Activity.sh
source ~/.local/share/meradeb/applications/Meradeb.sh
source ~/.local/share/meradeb/applications/Neovim.sh
source ~/.local/share/meradeb/applications/WhatsApp.sh
source ~/.local/share/meradeb/applications/YouTube-Music.sh
