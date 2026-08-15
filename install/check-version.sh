#!/bin/bash

if [ ! -f /etc/os-release ]; then
  echo "$(tput setaf 1)Error: Unable to determine OS. /etc/os-release file not found."
  echo "Installation stopped."
  exit 1
fi

. /etc/os-release

# Check if running on Ubuntu 24.04 or higher
if [ "$ID" != "debian" ] || [ $(echo "$VERSION_ID >= 13" | bc) != 1 ]; then
  echo "$(tput setaf 1)Warning: OS requirement not met"
  echo "You are currently running: $ID $VERSION_ID"
  echo "OS required: Debian 13 (trixie) is recommended"
  echo "Installation stopped."
fi

# Check if running on x86
# TODO: This was used in OMAKUB, need to check if its still applicable with newer versions
ARCH=$(uname -m)
if [ "$ARCH" != "x86_64" ] && [ "$ARCH" != "i686" ]; then
  echo "$(tput setaf 1)Error: Unsupported architecture detected"
  echo "Current architecture: $ARCH"
  echo "This installation is only supported on x86 architectures (x86_64 or i686)."
  echo "Installation stopped."
  exit 1
fi
