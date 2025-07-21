# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

path_add() {
    # First variable is the 'path' variable to add to.
    # Remaining variables are the paths to add.
    local input_path=$1 
    shift
    local dir 
    for dir in "$@"; do
        case ":$input_path:" in
            *":$dir:"*) ;;  # Already present 
            *) input_path="${input_path:+$input_path:}$dir" ;;
        esac
    done
    echo "$input_path" 
}

# export environment variables
PATH=$(path_add "$PATH" "$HOME/bin" "$HOME/.local/bin" "$HOME/.dotfiles/scripts")

if [[ "$OSTYPE" == linux-gnu ]]; then
    # local flatpaks and system-wide flatpaks
    PATH=$(path_add "$PATH" "$HOME/.local/share/flatpak/exports/bin" "/var/lib/flatpak/exports/bin")
fi

[[ "$OSTYPE" == "darwin22" ]] && export BASH_SILENCE_DEPRECATION_WARNING=1

export PATH
export EDITOR="nvim"
export VISUAL="nvim"
export BROWSER="vivaldi"
export MANPAGER="nvim +Man!"
export BAT_PAGER=less
export PAGER=less
export COLORTERM=truecolor
export GTK_THEME=Nordic
export GTK_ICON_THEME=Nordzy
export GTK2_RC_FILES=$HOME/.gtkrc-2.0
export XCURSOR_THEME=Nordzy-cursors
export STARSHIP_CONFIG="$HOME"/.config/starship/starship.toml
export FZF_DEFAULT_OPTS_FILE="$HOME"/.config/fzf/.fzfrc

XDG_DATA_DIRS=$(path_add "$XDG_DATA_DIRS" "$HOME/.local/bin" "/usr/local/share" "/usr/share")

# export common environment variables
if [[ "$OSTYPE" == "linux-gnu" ]]; then
    XDG_DATA_DIRS=$(path_add "$XDG_DATA_DIRS" "/var/lib/flatpak/exports/share" "$HOME/.local/share/flatpak/exports/share")
fi

export XDG_DATA_DIRS
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"
if command -v wezterm &> /dev/null; then
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
