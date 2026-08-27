#!/bin/bash

# Center new windows in the middle of the screen
gsettings set org.gnome.mutter center-new-windows true

# Set Cascadia Mono as the default monospace font
gsettings set org.gnome.desktop.interface monospace-font-name 'CaskaydiaMono Nerd Font 10'

# Turn off ambient sensors for setting screen brightness (they rarely work well!)
gsettings set org.gnome.settings-daemon.plugins.power ambient-enabled false

# System monitor
gsettings set org.gnome.shell.extensions.system-monitor show-cpu true
gsettings set org.gnome.shell.extensions.system-monitor show-download true
gsettings set org.gnome.shell.extensions.system-monitor show-upload true
gsettings set org.gnome.shell.extensions.system-monitor show-memory true
