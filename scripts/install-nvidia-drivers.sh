#!/bin/bash

set -e

sudo apt update

sudo apt install -y linux-headers-$(uname -r)

sudo apt update

wget https://developer.download.nvidia.com/compute/cuda/repos/debian$(. /etc/os-release && echo $VERSION_ID)/x86_64/cuda-keyring_1.1-1_all.deb

sudo dpkg -i cuda-keyring_1.1-1_all.deb

sudo apt update

sudo apt -V install -y nvidia-open

sudo apt dist-upgrade -y
reboot
