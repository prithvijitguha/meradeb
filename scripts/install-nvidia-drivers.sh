#!/bin/bash

apt update

apt install -y linux-headers-$(uname -r)

add-apt-repository contrib

apt update

wget https://developer.download.nvidia.com/compute/cuda/repos/debian$(. /etc/os-release && echo $VERSION_ID)/x86_64/cuda-keyring_1.1-1_all.deb

dpkg -i cuda-keyring_1.1-1_all.deb

apt update

apt install -y nvidia-driver-pinning-595.104.02

apt -V install -y nvidia-open

apt dist-upgrade -y

reboot
