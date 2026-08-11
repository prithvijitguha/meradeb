#!/bin/bash

if [[ -v OMADEB_FIRST_RUN_OPTIONAL_APPS ]]; then
  apps=$OMADEB_FIRST_RUN_OPTIONAL_APPS

  if [[ -n "$apps" ]]; then
    for app in $apps; do
      source "$OMADEB_PATH/install/desktop/optional/app-${app,,}.sh"
    done
  fi
fi
