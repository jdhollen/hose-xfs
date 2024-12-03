#!/bin/bash
set -o errexit -o nounset -o pipefail -x

sudo rm -rf /var/buildbuddy

sudo unmount /var/buildbuddy

sudo mdadm --stop /dev/md103
