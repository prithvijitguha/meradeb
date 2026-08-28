#!/bin/bash

echo "Installing all applications"
for script in ~/.local/share/meradeb/applications/*.sh; do source $script; done
