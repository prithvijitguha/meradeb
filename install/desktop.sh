#!/bin/bash

# Run desktop installers
for installer in ~/.local/share/meradeb/install/desktop/*.sh; do source $installer; done
