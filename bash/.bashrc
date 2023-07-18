# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Are we on Mac?
OS="$(uname -s)"

# Source global definitions on Linux.
if [ "$OS" == "Linux" ]; then
  if [ -f /etc/profile ]; then
      . /etc/profile
  fi
  if [ -f /etc/bashrc ]; then
      . /etc/bashrc
  fi
fi

# Load the homebrew envvars and bash completion on Mac.
if [ "$OS" == "Darwin" ]; then
  SHELL="/opt/homebrew/bin/bash"  # WHAT THE HELL ALACRITTY
  eval "$(/opt/homebrew/bin/brew shellenv)"
  [[ -r "/opt/homebrew/etc/profile.d/bash_completion.sh" ]] && . "/opt/homebrew/etc/profile.d/bash_completion.sh"
fi

# User specific aliases and functions.
if [ "$OS" == "Darwin" ]; then
  export CLICOLOR=1
  export LSCOLORS=ExGxBxDxCxEgEdxbxgxcxd
  alias ls='ls -lh'
  alias ll='ls -lh'
fi
if [ "$OS" == "Linux" ]; then
  alias ls='ls --color -lh'
  alias ll='ls --color -lh'
fi
alias u='cd ..'
alias uu='cd ../..'
alias uuu='cd ../../..'
alias uuuu='cd ../../../..'
alias uuuuu='cd ../../../../..'

# Similar to "open" on Mac.
if [ "$OS" == "Linux" ]; then
  alias open=xdg-open
fi

# Put cargo/rust/rustup on the PATH if they exist.
if [ -d "$HOME/.cargo/bin" ]; then
  export PATH="$HOME/.cargo/bin:$PATH"
  export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"
fi

# Use Redis for sccache.
# export SCCACHE_REDIS="redis://:ThisIsTheRedisPassword@university.bobsomers.net"

# ~/bin overrides system paths.
export PATH=~/bin:$PATH

# Add virtualenv to shell in a nice place if we're in one.
function venv_info {
  if [[ -n "$VIRTUAL_ENV" ]]; then
    venv="$(basename $(dirname $VIRTUAL_ENV))"
    echo " [venv:$venv]"
  else
    echo ""
  fi
}
export VIRTUAL_ENV_DISABLE_PROMPT=1

# Shell prompt shenanigans.
export PS1='\[\e[1;37m\]⎧ \[\e[1;33m\]\@ \[\e[1;35m\]\h\[\e[1;31m\]$(venv_info) \[\e[1;32m\]\w\n\[\e[1;37m\]⎩ \[\e[1;36m\]\u \[\e[1;37m\]\$ \[\e[0m\]'

# Default editor is Vim.
export EDITOR=vim

# Set syntax theme for bat and delta.
export BAT_THEME=1337

# Load FZF and set config.
export FZF_DEFAULT_COMMAND='fd --hidden --follow --exclude ".git" --exclude "bazel-*" --exclude ".cache" --exclude ".mozilla" --exclude ".cargo" --exclude ".npm"'
export FZF_DEFAULT_OPTS='--inline-info --no-height --reverse --preview "[[ $(file --mime {}) =~ binary ]] && ([[ $(file --mime {}) =~ directory ]] && tree -C -L 1 {} || file --brief {}) || (bat --color=always {})"'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="$FZF_DEFAULT_OPTS"
export FZF_CTRL_R_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_R_OPTS='--inline-info --no-height --reverse --preview "echo {} | sed \"s/^[[:space:]]*[[:digit:]]\\+[[:space:]]*//\"" --preview-window down:5:wrap'
export FZF_ALT_C_COMMAND='fd --type d --hidden --follow --exclude ".git" --exclude "bazel-*" --exclude ".cache" --exclude ".mozilla" --exclude ".cargo" --exclude ".npm"'
export FZF_ALT_C_OPTS='--inline-info --no-height --reverse --preview "tree -C -L 1 {}"'
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
