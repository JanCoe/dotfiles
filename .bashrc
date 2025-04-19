# Source definitions
[[ -f /etc/bashrc ]] && . /etc/bashrc
[[ -f ~/.profile ]] && . $HOME/.profile
[[ -f ~/.shell_aliases ]] && . $HOME/.shell_aliases

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        [ -f "$rc" ] && . "$rc"
    done
fi
unset rc

# Settings that depend on operating system
if [ "$OSTYPE" == "darwin22" ]  # MacOS
then
   export BASH_SILENCE_DEPRECATION_WARNING=1
fi

# Use VIM motions in the command line
set -o vi

# Initialise apps
eval "$(starship init bash)"
eval "$(zoxide init bash)"
alias cd="z" # set this after initialising zoxide
