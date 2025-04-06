# Use VIM motions in the command line
set -o vi

# Settings that depend on operating system
if [ "$OSTYPE" == "darwin22" ]  # MacOS
then
   export BASH_SILENCE_DEPRECATION_WARNING=1
fi

# Add to path if it is not in path already
if [[ ":$PATH:" != *":/opt/bin:"* ]]; then
    export PATH="$PATH:/opt/bin"
fi

# export PATH="$PATH:/usr/local/bin"

# Source if file exists
[ -f "$HOME/.local/bin/env" ] && . "$HOME/.local/bin/env"

# Set nvim for reading man pages
export MANPAGER='nvim +Man!'

source ~/.bash_aliases

# Initialise apps
eval "$(zoxide init bash)"
eval "$(starship init bash)"
