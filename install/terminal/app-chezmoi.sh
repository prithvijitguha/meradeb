#!/bin/bash

if ! command -v chezmoi >/dev/null 2>&1; then
  sh -c "$(curl -fsLS https://get.chezmoi.io)" -- -b "$HOME/.local/bin"
fi
