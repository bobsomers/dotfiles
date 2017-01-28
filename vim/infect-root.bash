#!/bin/bash

echo "Making symlinks."
ln -f -s ~bsomers/dotfiles/vim/vimrc ~root/.vimrc
ln -f -s ~bsomers/.vim ~root/.vim

echo "Done."
