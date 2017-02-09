#!/bin/sh
set -e

# we wait for the web server to start up
# Better approach would be to wait until it serves data
sleep 5 

echo "## Run Tests"
cd /project/tests
nosetests -v .