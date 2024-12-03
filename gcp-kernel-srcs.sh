#!/bin/bash
set -o errexit -o nounset -o pipefail


sudo cp /etc/apt/sources.list /etc/apt/sources.list~
sudo sed -Ei 's/^# deb-src /deb-src /' /etc/apt/sources.list
sudo apt-get update

sudo apt build-dep linux linux-image-unsigned-$(uname -r)
sudo apt install libncurses-dev gawk flex bison openssl libssl-dev dkms libelf-dev libudev-dev libpci-dev libiberty-dev autoconf llvm
apt source linux-image-unsigned-$(uname -r)
