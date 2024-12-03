#!/bin/bash
# fundamentally copied from https://wiki.ubuntu.com/Kernel/BuildYourOwnKernel
set -o errexit -o nounset -o pipefail


sudo cp /etc/apt/sources.list /etc/apt/sources.list~
sudo sed -Ei 's/^# deb-src /deb-src /' /etc/apt/sources.list
sudo apt-get update

sudo apt build-dep linux linux-image-unsigned-$(uname -r)
sudo apt install fakeroot libncurses-dev gawk flex bison openssl libssl-dev dkms libelf-dev libudev-dev libpci-dev libiberty-dev autoconf llvm
apt source linux-image-unsigned-$(uname -r)

# afterward, in kernel root dir..
# fakeroot debian/rules clean

# you might need to rm an extra dir or two if you're re-running...

# actually build..
# fakeroot debian/rules binary

# go back up a dir and install
# cd ..
# ls *.deb
# sudo dpkg -i linux*VERSION*.deb
# sudo reboot