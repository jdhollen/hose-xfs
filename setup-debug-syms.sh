#!/bin/bash
set -o errexit -o nounset -o pipefail -x

sudo apt install ubuntu-dbgsym-keyring

echo "deb http://ddebs.ubuntu.com $(lsb_release -cs) main restricted universe multiverse
deb http://ddebs.ubuntu.com $(lsb_release -cs)-updates main restricted universe multiverse
deb http://ddebs.ubuntu.com $(lsb_release -cs)-proposed main restricted universe multiverse" | sudo tee -a /etc/apt/sources.list.d/ddebs.list

sudo apt-get update

sudo apt-get install linux-image-`uname -r`-dbgsym pkg-config-dbgsym