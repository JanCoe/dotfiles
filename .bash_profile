# Get the aliases and functions
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

# User specific environment and startup programs
. "$HOME/.cargo/env"

# Source if it exists.
[ -f "$HOME/.local/bin/env" ] && [. "$HOME/.local/bin/env" ]
