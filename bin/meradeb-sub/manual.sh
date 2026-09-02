#!/bin/bash

chromium --app="file:///$MERADEB_PATH/docs/build/html/index.html" --name=Manual --class=Manual &>/dev/null
source $MERADEB_PATH/bin/meradeb-sub/menu.sh
