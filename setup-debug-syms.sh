#!/bin/bash
set -o errexit -o nounset -o pipefail -x

# i think you don't need this script at all on 22.04 if you're just running a vanilla kernel?

sudo apt install ubuntu-dbgsym-keyring

echo "deb http://ddebs.ubuntu.com $(lsb_release -cs) main restricted universe multiverse
deb http://ddebs.ubuntu.com $(lsb_release -cs)-updates main restricted universe multiverse
deb http://ddebs.ubuntu.com $(lsb_release -cs)-proposed main restricted universe multiverse" | sudo tee -a /etc/apt/sources.list.d/ddebs.list

sudo apt-get update

sudo apt-get install linux-image-`uname -r`-dbgsym xfsprogs-dbgsym

# might need pkg-config-dbgsym to build debug symbols?