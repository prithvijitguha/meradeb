#!/bin/bash

set -e

# POWERLEVEL10K
rm -rf "$HOME/.oh-my-zsh/custom/themes/powerlevel10k"

# ZSH AUTOSUGGESTIONS
rm -rf "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions"

# ZSH SYNTAX HIGHLIGHTING
rm -rf "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting"

# OH MY ZSH
rm -rf "$HOME/.oh-my-zsh"

# Change default shell back to bash
if command -v bash >/dev/null 2>&1; then
  chsh -s "$(command -v bash)"
fi
