#!/bin/bash

sudo apt update && sudo apt install build-essential meson ninja-build pkg-config
git clone --depth 1 https://github.com/SimplyCEO/wofi.git /tmp/wofi
cd wofi
meson setup build
ninja -C build
su -c "ninja -C build install"
