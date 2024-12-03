#!/bin/bash
set -o errexit -o nounset -o pipefail -x

sudo rm -rf /var/buildbuddy

sudo umount /var/buildbuddy || true

sudo mdadm --stop /dev/md103
