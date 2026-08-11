#!/bin/bash

if [[ -v omadeb_FIRST_RUN_OPTIONAL_APPS ]]; then
	apps=$omadeb_FIRST_RUN_OPTIONAL_APPS

	if [[ -n "$apps" ]]; then
		for app in $apps; do
			source "$omadeb_PATH/install/desktop/optional/app-${app,,}.sh"
		done
	fi
fi
