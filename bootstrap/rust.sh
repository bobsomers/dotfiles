#!/usr/bin/env bash
set -euo pipefail

function install_rust {
  if [ ! $(which rustup) ]; then
    curl https://sh.rustup.rs -sSf | sh -s -- -y --no-modify-path
    export PATH="$HOME/.cargo/bin:$PATH"
    rustup component add rust-src
  fi
}

install_rust
