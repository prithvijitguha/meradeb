#!/bin/bash

if [ ! -f /etc/os-release ]; then
  echo "$(tput setaf 1)Error: Unable to determine OS. /etc/os-release file not found."
  echo "Installation stopped."
  exit 1
fi

. /etc/os-release

if [ "$ID" != "debian" ] || [ $(echo "$VERSION_ID >= 13" | bc) != 1 ]; then
  echo "$(tput setaf 1)Warning: OS requirement not met"
  echo "You are currently running: $ID $VERSION_ID"
  echo "OS warning: Debian 13 (trixie) is recommended"
  echo "Installation stopped."
fi
