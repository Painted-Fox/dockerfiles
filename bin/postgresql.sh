#!/bin/bash

etc=$( cd -P "$( dirname $0 )/../etc/postgresql" && pwd )

SUDO=
if [[ $EUID -ne 0 ]]; then
    # Use sudo if we aren't root.
    SUDO="sudo -E"
fi

mkdir -p "/tmp/postgresql"
eval $SUDO chown daemon:daemon "/tmp/postgresql"
eval $SUDO chown 700 "/tmp/postgresql"
eval $SUDO docker run \
    -v $etc:"/data/etc" \
    -v "/tmp/postgresql":"/data/db" \
    paintedfox/postgresql
