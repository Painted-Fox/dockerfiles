#!/bin/bash
mkdir -p "/tmp/jekyll"
JEKYLL_USER=$SUDO_USER
if [[ -z "$JEKYLL_USER" ]]
then
    JEKYLL_USER=$USER
fi

docker run \
    -v `pwd`:"/data" \
    jekyll "$@"

chown -R "$JEKYLL_USER":"$JEKYLL_USER" _site
