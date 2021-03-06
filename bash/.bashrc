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

# Similar to "open" on Mac.
alias open=xdg-open

# Put cargo/rust/rustup on the PATH if they exist.
if [ -d "$HOME/.cargo/bin" ]; then
  export PATH="$HOME/.cargo/bin:$PATH"
  export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"
fi

# Use NVM to manage Node versions.
source /usr/share/nvm/init-nvm.sh

# Use Redis for sccache.
export SCCACHE_REDIS="redis://:ThisIsTheRedisPassword@university.bobsomers.net"

# ~/bin overrides system paths.
export PATH=~/bin:$PATH

# Shell prompt shenanigans.
export PS1='\[\e[1;37m\]⎧ \[\e[1;33m\]\@ \[\e[1;35m\]\h \[\e[1;32m\]\w\n\[\e[1;37m\]⎩ \[\e[1;36m\]\u \[\e[1;37m\]\$ \[\e[0m\]'

# Default editor is Vim.
export EDITOR=vim

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

# Source local configuration.
if [ -f ~/.bashrc_local ]; then
    . ~/.bashrc_local
fi
