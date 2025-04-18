
# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# Settings that depend on operating system
if [ "$OSTYPE" == "darwin22" ]  # MacOS
then
   export BASH_SILENCE_DEPRECATION_WARNING=1
fi

# Use VIM motions in the command line
set -o vi
#
# Add to path if it is not in path already
if [[ ":$PATH:" != *":/opt/bin:"* ]]; then
    export PATH="$PATH:/opt/bin"
fi
#
# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH
#
# export PATH="$PATH:/usr/local/bin"

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc

# Source if file exists
[ -f "$HOME/.local/bin/env" ] && . "$HOME/.local/bin/env"

# Set nvim for reading man pages
export MANPAGER='nvim +Man!'

source ~/.bash_aliases

# Initialise apps
eval "$(zoxide init bash)"
eval "$(starship init bash)"

. "$HOME/.cargo/env"
