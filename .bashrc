# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Source definitions
[[ -f /etc/bashrc ]] && . /etc/bashrc
[[ -f "$HOME/.aliases" ]] && . "$HOME/.aliases"

# User specific aliases and functions
if [[ -d ~/.bashrc.d ]]; then
    for rc in ~/.bashrc.d/*; do
        [[ -f "$rc" ]] && . "$rc"
    done
fi
unset rc

export HISTFILESIZE=10000 # number of commands to save to ~/.bash_history
export HISTSIZE=500 # number of commands to remember in memory
export HISTTIMEFORMAT="%F %T "
shopt -s histappend # append to the history file, don't overwrite it
export HISTCONTROL=erasedups:ignoredups:ignorespace 
export HISTIGNORE="ls:ll:cd:* --help" # ignore specific commands from history

# Initialise apps if they are available
if command -v starship &> /dev/null; then
    eval "$(starship init bash)"
fi

set -o vi
set -o history

if command -v zoxide &> /dev/null; then
    eval "$(zoxide init --cmd cd bash)"
fi

. "$HOME/.cargo/env"
export PATH="/home/JanCoe/.cargo/bin:$PATH"
export PATH="/home/JanCoe/.cargo/bin:$PATH"
