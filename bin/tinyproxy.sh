#!/bin/bash
mkdir -p "/tmp/tinyproxy/"
chown daemon:daemon "/tmp/tinyproxy"
docker run \
    -v `pwd`/etc:"/data/etc" \
    -v "/tmp/tinyproxy/":"/data/log" \
    -p 8765:8765 \
    -d \
    tinyproxy
