#!/bin/bash

echo "Making symlinks."
ln -f -s ~bsomers/dotfiles/vim/vimrc ~root/.vimrc
ln -f -s ~bsomers/dotfiles/vim/vimfiles ~root/.vim

echo "Done."
