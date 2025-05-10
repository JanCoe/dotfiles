# Source definitions
[[ -f /etc/bashrc ]] && . /etc/bashrc
[[ -f ~/.shell_aliases ]] && . $HOME/.shell_aliases

# User specific aliases and functions
if [[ -d ~/.bashrc.d ]]; then
    for rc in ~/.bashrc.d/*; do
        [[ -f "$rc" ]] && . "$rc"
    done
fi
unset rc

# Settings that depend on operating system
if [[ "$OSTYPE" == "darwin22" ]]  # MacOS
then
   export BASH_SILENCE_DEPRECATION_WARNING=1
fi

set -o vi
set -o history

PS1="\u@\h:\w\$ "

# Initialise apps
eval "$(starship init bash)"
eval "$(zoxide init bash)"
alias cd="z" # set this after initialising zoxide
