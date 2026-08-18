#!/bin/bash

set -e

# NEOVIM
if ! command -v nvim >/dev/null 2>&1; then
  cd /tmp
  wget -q -O nvim.tar.gz \
    "https://github.com/neovim/neovim/releases/download/stable/nvim-linux-x86_64.tar.gz"
  tar -xf nvim.tar.gz
  sudo install -m 755 nvim-linux-x86_64/bin/nvim /usr/local/bin/nvim
  sudo cp -R nvim-linux-x86_64/lib /usr/local/
  sudo cp -R nvim-linux-x86_64/share /usr/local/
  rm -rf nvim-linux-x86_64 nvim.tar.gz
  cd -
fi

# Luarocks and Tree-sitter CLI
if ! dpkg -s luarocks >/dev/null 2>&1 ||
  ! dpkg -s tree-sitter-cli >/dev/null 2>&1; then
  sudo apt update
  sudo apt install -y luarocks tree-sitter-cli
fi

# LAZYVIM CONFIGURATION
if [ ! -d "$HOME/.config/nvim" ]; then
  mkdir -p "$HOME/.config"
  cp -R "$HOME/.local/share/omadeb/configs/neovim" \
    "$HOME/.config/nvim"
  # Remove the .git folder so the configuration can be managed
  # in your own repository.
  rm -rf "$HOME/.config/nvim/.git"
  # Make everything match the terminal transparency
  mkdir -p "$HOME/.config/nvim/plugin/after"
  cp "$HOME/.local/share/omadeb/configs/neovim/transparency.lua" \
    "$HOME/.config/nvim/plugin/after/"
  # Default to Tokyo Night theme
  cp "$HOME/.local/share/omadeb/themes/tokyo-night/neovim.lua" \
    "$HOME/.config/nvim/lua/plugins/theme.lua"
  # Ensure editor.neo-tree is used by default
  cp "$HOME/.local/share/omadeb/configs/neovim/lazyvim.json" \
    "$HOME/.config/nvim/"
fi

# NEOVIM DESKTOP ENTRY
if [ -d "$HOME/.local/share/applications" ]; then
  if [ -f "$HOME/.local/share/omadeb/applications/Neovim.sh" ]; then
    sudo rm -f /usr/share/applications/nvim.desktop
    sudo rm -f /usr/local/share/applications/nvim.desktop
    source "$HOME/.local/share/omadeb/applications/Neovim.sh"
  fi
fi

# VIM SETUP
if [ ! -d "$HOME/.config/.vim" ]; then
  mkdir -p "$HOME/.config/.vim"
  cp "$HOME/.local/share/omadeb/configs/.vimrc" \
    "$HOME/.vimrc"
  cp -R "$HOME/.local/share/omadeb/configs/.vim/" \
    "$HOME/.config/.vim/"
fi
