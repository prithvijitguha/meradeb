#!/bin/bash
set -e

distrobox create --image debian:trixie --name meradeb-box --yes

distrobox enter meradeb-box -- curl -fsSL https://raw.githubusercontent.com/prithvijitguha/meradeb/main/boot.sh | bash
