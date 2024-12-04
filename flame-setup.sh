#!/bin/bash
set -o errexit -o nounset -o pipefail
# fundamentally copied from https://www.brendangregg.com/FlameGraphs/cpuflamegraphs.html

# for perf
sudo apt-get install linux-tools-common linux-tools-generic

git clone https://github.com/brendangregg/FlameGraph
