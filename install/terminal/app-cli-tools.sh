#!/bin/bash

set -e

# UV
if ! command -v uv >/dev/null 2>&1; then
  curl -LsSf https://astral.sh/uv/install.sh | sh
fi

# Download and install Node.js:
if ! command -v node >/dev/null 2>&1; then
  # Download and install nvm:
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.6/install.sh | bash
  # in lieu of restarting the shell
  \. "$HOME/.nvm/nvm.sh"
  # Download and install Node.js:
  nvm install 24
  # Verify the Node.js version:
  node -v # Should print "v24.18.1".
  # Verify npm version:
  npm -v # Should print "11.16.0".
fi

# RUSTUP
if ! command -v rustup >/dev/null 2>&1; then
  sudo apt update
  sudo apt install -y rustup
fi

# BAT
if ! command -v bat >/dev/null 2>&1 && ! command -v batcat >/dev/null 2>&1; then
  sudo apt update
  sudo apt install -y bat
fi

# EZA
if ! command -v eza >/dev/null 2>&1; then
  sudo mkdir -p /etc/apt/keyrings
  wget -qO- https://raw.githubusercontent.com/eza-community/eza/main/deb.asc | sudo gpg --dearmor -o /etc/apt/keyrings/gierens.gpg
  echo "deb [signed-by=/etc/apt/keyrings/gierens.gpg] http://deb.gierens.de stable main" | sudo tee /etc/apt/sources.list.d/gierens.list
  sudo chmod 644 /etc/apt/keyrings/gierens.gpg /etc/apt/sources.list.d/gierens.list
  sudo apt update
  sudo apt install -y ezafi
fi

# HUNK
if ! command -v hunk >/dev/null 2>&1; then
  npm install -g hunkdiff
fi

# Configure Hunk as Git pager
if ! command -v hunk >/dev/null 2>&1; then
  git config --global core.pager "hunk pager"
fi
