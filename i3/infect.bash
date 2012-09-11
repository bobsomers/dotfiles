#!/bin/bash

echo "Making symlinks."
mkdir -p ~/.i3
ln -f -s ~/dotfiles/i3/config ~/.i3/config

echo "Done."
