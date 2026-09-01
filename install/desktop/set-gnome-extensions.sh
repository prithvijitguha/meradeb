#!/bin/bash

pipx install gnome-extensions-cli --system-site-packages

# Install new extensions
yes | gext install tilingshell@ferrarodomenico.com
yes | gext install tactile@lundal.io
yes | gext install just-perfection-desktop@just-perfection
yes | gext install blur-my-shell@aunetx
yes | gext install space-bar@luchrioh
yes | gext install tophat@fflewddur.github.io
yes | gext install auto-move-windows@gnome-shell-extensions.gcampax.github.com

# Compile gsettings schemas
sudo cp ~/.local/share/gnome-shell/extensions/tilingshell@ferrarodomenico.com/schemas/org.gnome.shell.extensions.tilingshell.gschema.xml \
  /usr/share/glib-2.0/schemas/

sudo cp ~/.local/share/gnome-shell/extensions/tactile@lundal.io/schemas/org.gnome.shell.extensions.tactile.gschema.xml \
  /usr/share/glib-2.0/schemas/

sudo cp ~/.local/share/gnome-shell/extensions/just-perfection-desktop@just-perfection/schemas/org.gnome.shell.extensions.just-perfection.gschema.xml \
  /usr/share/glib-2.0/schemas/

sudo cp ~/.local/share/gnome-shell/extensions/blur-my-shell@aunetx/schemas/org.gnome.shell.extensions.blur-my-shell.gschema.xml \
  /usr/share/glib-2.0/schemas/

sudo cp ~/.local/share/gnome-shell/extensions/space-bar@luchrioh/schemas/org.gnome.shell.extensions.space-bar.gschema.xml \
  /usr/share/glib-2.0/schemas/

sudo cp ~/.local/share/gnome-shell/extensions/tophat@fflewddur.github.io/schemas/org.gnome.shell.extensions.tophat.gschema.xml \
  /usr/share/glib-2.0/schemas/

sudo cp ~/.local/share/gnome-shell/extensions/auto-move-windows@gnome-shell-extensions.gcampax.github.com/schemas/org.gnome.shell.extensions.auto-move-windows.gschema.xml \
  /usr/share/glib-2.0/schemas/

sudo glib-compile-schemas /usr/share/glib-2.0/schemas/
