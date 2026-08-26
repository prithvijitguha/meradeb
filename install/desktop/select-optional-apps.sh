#!/bin/bash

if [[ -v MERADEB_FIRST_RUN_OPTIONAL_APPS ]]; then
  apps=$MERADEB_FIRST_RUN_OPTIONAL_APPS

  if [[ -n "$apps" ]]; then
    for app in $apps; do
      source "$MERADEB_PATH/install/desktop/optional/app-${app,,}.sh"
    done
  fi
fi
