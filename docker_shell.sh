#!/usr/bin/env bash

# Get the script's path
pushd `dirname $0` > /dev/null
SCRIPTPATH=`pwd`
popd > /dev/null

set -e

# Run the container with shared X11
docker run\
       -it\
       --privileged=true\
       -u 0\
       --net=host\
       -e DISPLAY=unix$DISPLAY\
       -e DOCKER=1\
       -e USER\
       -e UID=`id --user`\
       -e GID=`id --group`\
       -e HOME\
       -v "$HOME:$HOME:rw"\
       -v "/tmp/.X11-unix:/tmp/.X11-unix:rw"\
       $1 ${SCRIPTPATH}/entry.sh
