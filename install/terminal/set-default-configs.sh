#!/bin/bash

mkdir -p ~/.config
mkdir -p ~/.config/btop
mkdir -p ~/.config/btop/themes

cp ~/.local/share/meradeb/configs/.bashrc ~/.config/.bashrc
cp ~/.local/share/meradeb/configs/.zshrc ~/.config/.zshrc
cp ~/.local/share/meradeb/configs/.p10.zsh ~/.config/.p10.zsh
cp ~/.local/share/meradeb/configs/.profile ~/.config/.profile
cp ~/.local/share/meradeb/configs/.tmux.conf ~/.config/.tmux.conf
cp ~/.local/share/meradeb/configs/.vimrc ~/.config/.vimrc
cp ~/.local/share/meradeb/configs/btop.conf ~/.config/btop/btop.conf
cp -r ~/.local/share/meradeb/configs/.vim ~/.config/.vim
cp -r ~/.local/share/meradeb/configs/fastfetch ~/.config/fastfetch
cp -r ~/.local/share/meradeb/configs/ghostty ~/.config/ghostty
cp -r ~/.local/share/meradeb/configs/hunk ~/.config/hunk
cp -r ~/.local/share/meradeb/configs/neovim ~/.config/nvim
cp -r ~/.local/share/meradeb/configs/wofi ~/.config/wofi

# Meradeb integration
export MERADEB_PATH="$HOME/.local/share/meradeb"
export PATH="$HOME/.local/share/meradeb/bin:$HOME/.local/bin:$PATH"
