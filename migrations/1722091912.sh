#!/bin/bash

sudo echo "Running upgrade migration..."

# Add rustc and pgsql client libs
source $OMADEB_PATH/install/terminal/libraries.sh

# Set name and class for desktop files
source $OMADEB_PATH/applications/About.sh
source $OMADEB_PATH/applications/Activity.sh
source $OMADEB_PATH/applications/Basecamp.sh
source $OMADEB_PATH/applications/HEY.sh
source $OMADEB_PATH/applications/Docker.sh
source $OMADEB_PATH/applications/Neovim.sh
source $OMADEB_PATH/applications/Omadeb.sh
source $OMADEB_PATH/applications/WhatsApp.sh
