#!/bin/bash

echo "Fixing permissions."
chmod 600 ~/keys/authorized_keys
chmod 600 ~/keys/config

echo "Making symlinks."
ln -f -s ~/dotfiles/authorized_keys ~/.ssh/authorized_keys
ln -f -s ~/dotfiles/config ~/.ssh/config

echo "Done."
