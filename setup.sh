#!/bin/bash
set -o errexit -o nounset -o pipefail -x

sudo mkdir /var/buildbuddy

sudo mdadm --create --verbose /dev/md103 --level=0 --raid-devices=2 /dev/nvme3n1 /dev/nvme4n1

sudo mkfs.xfs /dev/md103 -d agcount=512 -l size=2038m

sudo mount -o logbsize=256k /dev/md127 /var/buildbuddy

sudo mkdir /var/buildbuddy/tmp

lsblk