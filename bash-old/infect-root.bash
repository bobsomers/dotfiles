#!/bin/bash

echo "Making symlinks."
ln -f -s ~bsomers/dotfiles/bash/bashrc ~root/.bashrc
ln -f -s ~bsomers/dotfiles/bash/bashrc_local-root ~root/.bashrc_local

echo "Done."
