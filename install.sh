#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Give people a chance to retry running the installation
trap 'echo "Meradeb installation failed! You can retry by running: source ~/.local/share/meradeb/install.sh"' ERR

# Check the distribution name and version and abort if incompatible
source ~/.local/share/meradeb/install/check-version.sh

source ~/.local/share/meradeb/install/terminal/required/app-gum.sh >/dev/null

MODE=$(gum choose \
  "Default" \
  "Advanced" \
  --height 5 \
  --header "Installation Mode" |
  tr '[:upper:]' '[:lower:]')

case "$MODE" in
default)
  echo "Installing default packages..."
  # Default installation commands here
  # Desktop software and tweaks will only be installed if we're running Gnome
  # Ensure computer doesn't go to sleep or lock while installing
  gsettings set org.gnome.desktop.screensaver lock-enabled false
  gsettings set org.gnome.desktop.session idle-delay 0
  echo "Installing terminal and desktop tools..."
  # Install terminal tools
  source ~/.local/share/meradeb/install/install-base-packages.sh
  # Install desktop tools and tweaks
  source ~/.local/share/meradeb/install/desktop.sh
  # Revert to normal idle and lock settings
  gsettings set org.gnome.desktop.screensaver lock-enabled true
  gsettings set org.gnome.desktop.session idle-delay 300

advanced)
  OPTIONS=$(gum choose \
    "GNOME Extensions and Settings" \
    "Terminal Packages" \
    "Desktop Packages" \
    "Applications Only" \
    --no-limit \
    --height 8 \
    --header "Select Components to Install")

  while IFS= read -r OPTION; do
    case "$OPTION" in
    "GNOME Extensions and Settings")
      echo "Installing GNOME extensions and settings..."
      source ~/.local/share/meradeb/install/desktop/install-gnome-packages-settings.sh 


    "Terminal Packages")
      echo "Installing terminal packages..."
      source ~/.local/share/meradeb/install/terminal/install-all-terminal-packages.sh 

    "Desktop Packages")
      echo "Installing desktop packages..."
      # Desktop package installation commands
      source ~/.local/share/meradeb/install/desktop/install-other-packages.sh 

    "Applications")
      echo "Installing applications..."
      source ~/.local/share/meradeb/install/install-applications.sh 
    esac
  done <<<"$OPTIONS"
  ;;
esac

