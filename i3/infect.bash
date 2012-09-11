#!/bin/bash

echo "Making symlinks."
mkdir -p ~/.i3
ln -f -s ~/dotfiles/i3/config ~/.i3/config
mkdir -p ~/.config/i3status
ln -f -s ~/dotfiles/i3/status ~/.config/i3status/config
ln -f -s ~/dotfiles/i3/status-aux ~/.config/i3status/config-aux

echo "Done."
