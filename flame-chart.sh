#!/bin/bash
set -o errexit -o nounset -o pipefail

# fundamentally copied from https://www.brendangregg.com/FlameGraphs/cpuflamegraphs.html

cd FlameGraph
sudo perf record -F 99 -a -g --call-graph=dwarf -- sleep 60
sudo chmod a+r perf.data
sudo perf script --kallsyms=/proc/kallsyms | ./stackcollapse-perf.pl > out.perf-folded
./flamegraph.pl out.perf-folded > perf.svg
