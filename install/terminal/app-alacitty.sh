#!/bin/bash

# Alacritty is a GPU-powered and highly extensible terminal. See https://alacritty.org/
sudo apt install -y alacritty
mkdir -p ~/.config/alacritty
cp ~/.local/share/omadeb/configs/alacritty.toml ~/.config/alacritty/alacritty.toml
cp ~/.local/share/omadeb/configs/alacritty/shared.toml ~/.config/alacritty/shared.toml
cp ~/.local/share/omadeb/configs/alacritty/pane.toml ~/.config/alacritty/pane.toml
cp ~/.local/share/omadeb/configs/alacritty/btop.toml ~/.config/alacritty/btop.toml
cp ~/.local/share/omadeb/themes/tokyo-night/alacritty.toml ~/.config/alacritty/theme.toml
cp ~/.local/share/omadeb/configs/alacritty/fonts/CaskaydiaMono.toml ~/.config/alacritty/font.toml
cp ~/.local/share/omadeb/configs/alacritty/font-size.toml ~/.config/alacritty/font-size.toml
