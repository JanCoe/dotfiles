# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

if [[ "$OSTYPE" == "darwin22" ]]; then # MacOS
   export BASH_SILENCE_DEPRECATION_WARNING=1
fi

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
path_add "$HOME/bin" "$HOME/.local/bin" "$HOME/.dotfiles/scripts"

# Only for Linux: if [[ "$OSTYPE" == xxx ]]; then ... fi
# local flatpaks
path_add "$HOME/.local/share/flatpak/exports/bin"
# system-wide flatpaks
path_add "/var/lib/flatpak/exports/bin"

export EDITOR="nvim"
export MANPAGER="nvim +Man!"
export BAT_PAGER=less
export COLORTERM=truecolor
export STARSHIP_CONFIG=~/.config/starship/starship.toml

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
# if [[ "$OSTYPE" == xx ]]; then ... fi
data_dirs_add "/var/lib/flatpak/exports/share" "$HOME/.local/share/flatpak/exports/share"

data_dirs_add  "$HOME/.local/bin" "/usr/local/share" "/usr/share"

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
if command -v wezterm >/dev/null 2>&1; then
    export TERMINAL="$(command -v wezterm)"
fi

# initialise common tools if they exist
[[ -f "$HOME/.cargo/env" ]] && . "$HOME/.cargo/env"
[[ -f "$HOME/.local/bin/env" ]] && . "$HOME/.local/bin/env"

# source rc files in case this is a login shell
if [[ -n "$BASH_VERSION" ]]; then
    [[ -r "$HOME/.bashrc" ]] && . "$HOME/.bashrc"
elif [[ -n "$ZSH_VERSION" ]]; then
    [[ -r "$HOME/.zshrc" ]] && . "$HOME/.zshrc"
fi
