#!/bin/bash

SUDO=
if [[ $EUID -ne 0 ]]; then
    # Use sudo if we aren't root.
    SUDO="sudo -E"
fi

mkdir -p "/tmp/tinyproxy/"
eval $SUDO chown daemon:daemon "/tmp/tinyproxy"
eval $SUDO docker run \
    -v `pwd`/etc:"/data/etc" \
    -v "/tmp/tinyproxy/":"/data/log" \
    -p 8765:8765 \
    -d \
    paintedfox/tinyproxy:1.8.3
