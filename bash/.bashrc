# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Source global definitions.
if [ -f /etc/profile ]; then
    . /etc/profile
fi
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific aliases and functions.
alias ls='ls --color -lh'
alias ll='ls --color -lh'
alias u='cd ..'
alias uu='cd ../..'
alias uuu='cd ../../..'
alias uuuu='cd ../../../..'
alias uuuuu='cd ../../../../..'

# Put cargo/rust/rustup on the PATH if they exist.
if [ -d "$HOME/.cargo/bin" ]; then
  export PATH="$HOME/.cargo/bin:$PATH"
  export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"
fi

# ~/bin overrides system paths.
export PATH=~/bin:$PATH

# Shell prompt shenanigans.
export PS1='\[\e[1;37m\]⎧ \[\e[1;33m\]\@ \[\e[1;35m\]\h \[\e[1;32m\]\w\n\[\e[1;37m\]⎩ \[\e[1;36m\]\u \[\e[1;37m\]\$ \[\e[0m\]'

# Default editor is Vim.
export EDITOR=vim

# Terminal supports 256 colors.
export TERM=xterm-256color

# Source local configuration.
if [ -f ~/.bashrc_local ]; then
    . ~/.bashrc_local
fi
