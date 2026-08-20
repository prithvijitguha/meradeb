#!/bin/bash

# Setup default configs
cp ~/.local/share/omadeb/configs/.p10.zsh ~/.p10.zsh
cp ~/.local/share/omadeb/configs/.profile ~/.profile
cp ~/.local/share/omadeb/configs/.zshrc ~/.zshrc
cp ~/.local/share/omadeb/configs/.tmux.conf ~/.tmux.conf

# Use omadeb btop config
mkdir -p ~/.config/btop/themes
cp ~/.local/share/omadeb/configs/btop.conf ~/.config/btop/btop.conf
cp ~/.local/share/omadeb/themes/tokyo-night/btop.theme ~/.config/btop/themes/tokyo-night.theme
