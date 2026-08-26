#!/bin/bash

chromium --app="https://manual.omakub.org" --name=Manual --class=Manual &>/dev/null
source $MERADEB_PATH/bin/meradeb-sub/menu.sh
