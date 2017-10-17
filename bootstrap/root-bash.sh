#!/usr/bin/env bash
set -euo pipefail

function install_root_bash {
  sudo ln -f -s ~bsomers/dotfiles/bash/.bash_profile ~root/.bash_profile
  sudo ln -f -s ~bsomers/dotfiles/bash/.bashrc ~root/.bashrc
  sudo ln -f -s ~bsomers/dotfiles/bootstrap/.bashrc_local-root ~root/.bashrc_local
}

install_root_bash
