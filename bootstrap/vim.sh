#!/usr/bin/env bash
set -euo pipefail

function install_vim_plugins {
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  vim +PlugInstall +qall
  ~/.vim/plugged/YouCompleteMe/install.py --clang-completer --racer-completer
}

function install_root_vim {
  sudo ln -f -s ~bsomers/dotfiles/vim/.vimrc ~root/.vimrc
  sudo ln -f -s ~bsomers/.vim ~root/.vim
}

install_vim_plugins
install_root_vim
