#!/bin/sh
set -e

echo "## Compile"
cd job_dependencies
mkdir build
cd build
cmake ..
make

echo "## Copy to output"
mkdir -p /infrabox/output
cp tests /infrabox/output/
