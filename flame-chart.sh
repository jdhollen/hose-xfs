#!/bin/bash
# fundamentally copied from https://www.brendangregg.com/FlameGraphs/cpuflamegraphs.html
set -o errexit -o nounset -o pipefail

cd FlameGraph
sudo perf record -F 99 -a -g -- sleep 60
sudo chmod a+r perf.data
perf script | ./stackcollapse-perf.pl > out.perf-folded
./flamegraph.pl out.perf-folded > perf.svg
