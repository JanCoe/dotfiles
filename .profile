# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

path_add() {
    for dir in "$@"; do
        case ":$PATH:" in
            *":$dir:"*) ;;  # Already in PATH — do nothing
            *) PATH="${PATH:+$PATH:}$dir" ;;
        esac
    done
    export PATH
}

# export environment variables
path_add "$HOME/bin" "$HOME/.local/bin"
export EDITOR="nvim"
export MANPAGER="nvim +Man!"

data_dirs_add() {
    for dir in "$@"; do
        case ":$XDG_DATA_DIRS:" in
            *":$dir:"*) ;;  # Already in PATH — do nothing
            *) XDG_DATA_DIRS="${XDG_DATA_DIRS:+$XDG_DATA_DIRS:}$dir" ;;
        esac
    done
    export XDG_DATA_DIRS
}

# export common environment variables
data_dirs_add "/var/lib/flatpak/exports/share" "$HOME/.local/share/flatpak/exports/share" "$HOME/.local/bin"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export MANPAGER='nvim +Man!'

# initialise common tools if they exist
[ -f "$HOME/.cargo/env" ] && . "$HOME/.cargo/env"
[ -f "$HOME/.local/bin/env" ] && . "$HOME/.local/bin/env"
