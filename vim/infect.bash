#!/bin/bash

echo "Making symlinks."
ln -f -s ~/dotfiles/vim/vimrc ~/.vimrc
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "Done."
