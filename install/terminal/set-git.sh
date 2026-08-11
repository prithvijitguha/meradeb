#!/bin/bash

# Set common git aliases
git config --global pull.rebase true

# Set identification from install inputs
if [[ -n "${omadeb_USER_NAME//[[:space:]]/}" ]]; then
  git config --global user.name "$omadeb_USER_NAME"
fi

if [[ -n "${omadeb_USER_EMAIL//[[:space:]]/}" ]]; then
  git config --global user.email "$omadeb_USER_EMAIL"
fi
