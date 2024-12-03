#!/bin/bash
set -o errexit -o nounset -o pipefail -x

TMPDIRA=/var/buildbuddy/tmp/$(uuidgen)

mkdir -p $TMPDIRA
cd $TMPDIRA
tar xzf ~/hose-xfs/bigbad.tar.gz
cd ~/hose-xfs
rm -rf $TMPDIRA
