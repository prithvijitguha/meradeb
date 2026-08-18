#!/bin/bash

cp ~/.local/share/omadeb/configs/alacritty/shared.toml ~/.config/alacritty/shared.toml
cp ~/.local/share/omadeb/configs/alacritty/pane.toml ~/.config/alacritty/pane.toml
cp ~/.local/share/omadeb/configs/alacritty/btop.toml ~/.config/alacritty/btop.toml
cp ~/.local/share/omadeb/configs/alacritty.toml ~/.config/alacritty/alacritty.toml

source $OMADEB_PATH/applications/About.sh
source $OMADEB_PATH/applications/Activity.sh
source $OMADEB_PATH/applications/Neovim.sh
source $OMADEB_PATH/applications/Docker.sh
source $OMADEB_PATH/applications/Omadeb.sh

alacritty migrate 2>/dev/null || true
alacritty migrate -c ~/.config/alacritty/pane.toml 2>/dev/null || true
alacritty migrate -c ~/.config/alacritty/btop.toml 2>/dev/null || true
