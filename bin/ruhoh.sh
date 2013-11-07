#!/bin/bash

SUDO=
if [[ $EUID -ne 0 ]]; then
    # Use sudo if we aren't root.
    SUDO="sudo -E"
fi

# Get the user running sudo.
RUHOH_USER=$SUDO_USER
if [[ -z "$RUHOH_USER" ]]; then
    RUHOH_USER=$USER
fi

# Run jekyll in the docker container.
eval $SUDO docker run \
    -v `pwd`:"/data" \
    paintedfox/ruhoh "$@"

# If we produced a _site folder, set the owner back to the original user.
if [ -d compiled ]; then
    eval $SUDO chown -R "$RUHOH_USER":"$RUHOH_USER" compiled
fi
