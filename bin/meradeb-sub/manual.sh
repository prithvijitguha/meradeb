#!/bin/bash
#!/bin/bash

mkdocs serve --dev-addr 127.0.0.1:8000 >/dev/null 2>&1 &

chromium --app="http://127.0.0.1:8000" \
  --name=Manual \
  --class=Manual \
  &>/dev/null &

source $MERADEB_PATH/bin/meradeb-sub/menu.sh
