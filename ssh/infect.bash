#!/bin/bash

echo "Fixing permissions."
chmod 600 ~/dotfiles/ssh/authorized_keys
chmod 600 ~/dotfiles/ssh/config

echo "Making symlinks."
ln -f -s ~/dotfiles/ssh/authorized_keys ~/.ssh/authorized_keys
ln -f -s ~/dotfiles/ssh/config ~/.ssh/config

echo "Done."
