#!/bin/bash

# Setup default configs
cp -a ~/.local/share/meradeb/configs/. ~/.config/

# Use meradeb btop config
mkdir -p ~/.config/btop/themes
cp ~/.local/share/meradeb/configs/btop.conf ~/.config/btop/btop.conf

# Meradeb integration
export MERADEB_PATH="$HOME/.local/share/meradeb"
export PATH="$HOME/.local/share/meradeb/bin:$HOME/.local/bin:$PATH"
