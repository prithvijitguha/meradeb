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
  "Advanced (Install individual components)" \
  --height 5 \
  --header "Installation Mode" |
  tr '[:upper:]' '[:lower:]')

case "$MODE" in
"default")
  source ~/.local/share/meradeb/install/desktop/install-gnome-packages-settings.sh
  source ~/.local/share/meradeb/install/terminal/install-all-terminal-packages.sh
  source ~/.local/share/meradeb/install/desktop/install-other-packages.sh
  source ~/.local/share/meradeb/install/install-applications.sh
  ;;
"advanced (install individual components)")
  OPTIONS=$(gum choose \
    "GNOME Extensions and Settings" \
    "Terminal Packages" \
    "Desktop Packages" \
    "Applications" \
    --no-limit \
    --height 8 \
    --header "Select Components to Install")

  while IFS= read -r OPTION; do
    case "$OPTION" in
    "GNOME Extensions and Settings")
      source ~/.local/share/meradeb/install/desktop/install-gnome-packages-settings.sh
      ;;
    "Terminal Packages")
      source ~/.local/share/meradeb/install/terminal/install-all-terminal-packages.sh
      ;;
    "Desktop Packages")
      source ~/.local/share/meradeb/install/desktop/install-other-packages.sh
      ;;
    "Applications")
      source ~/.local/share/meradeb/install/install-applications.sh
      ;;
    esac
  done <<<"$OPTIONS"
  ;;
esac

gum log --structured --level info "Installation complete"
