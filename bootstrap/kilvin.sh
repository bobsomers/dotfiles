#!/usr/bin/env bash
set -euo pipefail

function install_packages {
  if [ ! $(which brew) ]; then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  fi
  brew update
  xargs brew install < kilvin_packages.txt
}

function install_dotfiles {
  pushd ..
  stow --verbose --no-folding vim
  popd
}

function install_rust {
  if [ ! $(which rustup) ]; then
    curl https://sh.rustup.rs -sSf | sh -s -- -y --no-modify-path
    export PATH="$HOME/.cargo/bin:$PATH"
    rustup component add rust-src
  fi
}

function install_vim_plugins {
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  vim +PlugInstall +qall
  ~/.vim/plugged/YouCompleteMe/install.py --clang-completer --racer-completer
}

function install_root_vim {
  sudo ln -f -s ~bsomers/dotfiles/vim/.vimrc ~root/.vimrc
  sudo ln -f -s ~bsomers/.vim ~root/.vim
}

install_packages
install_dotfiles
install_rust
install_vim_plugins
install_root_vim
