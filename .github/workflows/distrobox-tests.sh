#!/bin/bash
set -e

podman run --rm -it \
  --name meradeb \
  debian:trixie \
  bash -c '
    apt-get update
    apt-get install -y git curl bc sudo gum expect

    curl -fsSL https://raw.githubusercontent.com/prithvijitguha/meradeb/main/boot.sh -o /tmp/boot.sh

    expect <<EOF
set timeout -1
spawn bash /tmp/boot.sh
expect "Installation Mode"
send "\r"
expect eof
EOF
  '
