#!/bin/sh
set -e

echo "## Compile"
cd simple_project
mkdir build
cd build
cmake ..
make

echo "## Run Tests"
./tests
