#!/bin/bash
set -o errexit -o nounset -o pipefail

RUNS=300

echo "Starting!"
for i in `seq $RUNS`; do
    ./spin.sh &
done

echo "Waiting!"
wait
