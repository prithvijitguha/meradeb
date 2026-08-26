#!/bin/bash

# Set common git aliases
git config --global pull.rebase true

# Set identification from install inputs
if [[ -n "${MERADEB_USER_NAME//[[:space:]]/}" ]]; then
  git config --global user.name "$MERADEB_USER_NAME"
fi

if [[ -n "${MERADEB_USER_EMAIL//[[:space:]]/}" ]]; then
  git config --global user.email "$MERADEB_USER_EMAIL"
fi
