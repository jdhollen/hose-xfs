#!/bin/bash
set -o errexit -o nounset -o pipefail -x

TMPDIRA=/var/buildbuddy/tmp/$(uuidgen)

mkdir -p $TMPDIRA
cd $TMPDIRA
tar xzf ~/bigbad.tar.gz
cd ~
rm -rf $TMPDIRA
