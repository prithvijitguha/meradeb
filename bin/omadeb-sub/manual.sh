#!/bin/bash

chromium --app="https://manual.omakub.org" --name=Manual --class=Manual &>/dev/null
source $OMADEB_PATH/bin/omadeb-sub/menu.sh
