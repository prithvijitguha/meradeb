#!/bin/bash

set -e

if grep -RqsE '^[[:space:]]*deb .* (contrib )?non-free' \
  /etc/apt/sources.list /etc/apt/sources.list.d/*.list \
  /etc/apt/sources.list.d/*.sources 2>/dev/null; then
  echo "non-free already enabled"
else
  echo "Enabling non-free repositories..."

  sed -i -E \
    '/^[[:space:]]*deb / {
            /non-free/! s/ main( |$)/ main contrib non-free non-free-firmware\1/
        }' \
    /etc/apt/sources.list

  apt update

  echo "non-free enabled"
fi
