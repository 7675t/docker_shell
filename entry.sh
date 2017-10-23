#!/usr/bin/env bash

# Setup the user and group
addgroup --gid $GID $USER
adduser --disabled-password --no-create-home --gecos '' --uid $UID --gid $GID $USER
echo "$USER ALL=(ALL) NOPASSWD: ALL" > "/etc/sudoers.d/$USER"
chmod 0440 "/etc/sudoers.d/$USER"

# Start shell
sudo -u $USER bash -l
