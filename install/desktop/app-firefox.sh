#!/bin/bash

if ! command -v firefox >/dev/null 2>&1; then
  sudo apt update
  sudo apt install -y firefox-esr
fi
