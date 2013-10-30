#!/bin/bash

SUDO=
if [[ $EUID -ne 0 ]]; then
    # Use sudo if we aren't root.
    SUDO="sudo -E"
fi

# Get the user running sudo.
JEKYLL_USER=$SUDO_USER
if [[ -z "$JEKYLL_USER" ]]; then
    JEKYLL_USER=$USER
fi

# Run jekyll in the docker container.
eval $SUDO docker run \
    -v `pwd`:"/data" \
    paintedfox/jekyll "$@"

# If we produced a _site folder, set the owner back to the original user.
if [ -d _site ]; then
    eval $SUDO chown -R "$JEKYLL_USER":"$JEKYLL_USER" _site
fi
