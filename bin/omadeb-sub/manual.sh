#!/bin/bash

chromium --app="https://manual.omakub.org" --name=Manual --class=Manual &>/dev/null
source $OMADEB_PATH/bin/meradeb-sub/menu.sh
