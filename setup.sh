#!/bin/bash
set -o errexit -o nounset -o pipefail -x

sudo mkdir /var/buildbuddy

sudo mdadm --create --verbose /dev/md103 --level=0 --raid-devices=4 /dev/nvme1n1 /dev/nvme2n1 /dev/nvme3n1 /dev/nvme4n1

sudo mkfs.xfs /dev/md103 -l size=2038m -d agcount=112 -f

sudo mount -o logbsize=256k /dev/md103 /var/buildbuddy

sudo mkdir /var/buildbuddy/tmp

sudo chmod a+rw /var/buildbuddy/tmp

lsblk

./tarwars.sh