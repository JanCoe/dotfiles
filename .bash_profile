. "$HOME/.cargo/env"

# bash_profile instead of bashrc is called from a login shell. Force bashrc to run too.
source ~/.bashrc

# Source if it exists.
[ -f "$HOME/.local/bin/env" ] && [. "$HOME/.local/bin/env" ]
