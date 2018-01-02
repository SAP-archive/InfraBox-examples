#!/bin/sh
cache_path=/infrabox/cache/out.txt

if [ -f $cache_path ]; then
    echo "Cache exists"
else
    echo "Cache does not exist, creating it"
    echo "Hello world" > $cache_path
fi
