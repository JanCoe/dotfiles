# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Source definitions
[[ -f /etc/bashrc ]] && . /etc/bashrc
[[ -f ~/.aliases ]] && . $HOME/.aliases

# User specific aliases and functions
if [[ -d ~/.bashrc.d ]]; then
    for rc in ~/.bashrc.d/*; do
        [[ -f "$rc" ]] && . "$rc"
    done
fi
unset rc

# Settings that depend on operating system
if [[ "$OSTYPE" == "darwin22" ]]; then # MacOS
   export BASH_SILENCE_DEPRECATION_WARNING=1
fi

set -o vi
set -o history

HISTSIZE=10000 # number of commands to remember in memory
HISTFILESIZE=20000 # number of commands to szve to ~/.bash_history
shopt -s histappend # append tot he history file, don't overwrite it
export HISTCONTROL=ignoredups:ignorespace # don't sotre duplicate lines or commands starting with a space
export HISTIGNORE="ls:ll:cd:* --help" # ignore specific commands from history

# Initialise apps if they are available
if command -v starship > /dev/null 2>&1; then
    eval "$(starship init bash)"
fi

if command -v zoxide > /dev/null 2>&1; then
    eval "$(zoxide init bash)"
    alias cd="z" # set this after initialising zoxide
fi
