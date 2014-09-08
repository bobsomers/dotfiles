#!/bin/bash

echo "Making symlinks."
ln -f -s ~/dotfiles/X11/xinitrc ~/.xinitrc
#ln -f -s ~/dotfiles/X11/Xmodmap ~/.Xmodmap
ln -f -s ~/dotfiles/X11/Xresources ~/.Xresources

echo "Done."
