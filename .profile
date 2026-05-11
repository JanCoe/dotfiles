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

export XDG_DATA_HOME=$HOME/.local/share
XDG_DATA_DIRS=$(path_add "$XDG_DATA_DIRS" "/usr/local/share" "/usr/share")
if [[ "$OSTYPE" == "linux-gnu" ]]; then
    XDG_DATA_DIRS=$(path_add "$XDG_DATA_DIRS" "/var/lib/flatpak/exports/share" "$HOME/.local/share/flatpak/exports/share")
fi
export XDG_DATA_DIRS
export XDG_CONFIG_HOME=$HOME/.config
export XDG_STATE_HOME=$HOME/.local/state
export XDG_CACHE_HOME=$HOME/.cache

# export environment variables
PATH=$(path_add "$PATH" "$HOME/bin" "$HOME/.local/bin" "$HOME/.dotfiles/scripts" "$HOME/.cargo/bin")

if [[ "$OSTYPE" == linux-gnu ]]; then
    # local flatpaks and system-wide flatpaks
    PATH=$(path_add "$PATH" "$HOME/.local/share/flatpak/exports/bin" "/var/lib/flatpak/exports/bin")
fi

[[ "$OSTYPE" == darwin22 ]] && export BASH_SILENCE_DEPRECATION_WARNING=1

export PATH
export BROWSER="vivaldi-stable"
export EDITOR=nvim
export VISUAL=nvim
export SYSTEMD_EDITOR=nvim
export MANPAGER="nvim +Man!"
export PAGER=less
export BAT_PAGER=less
export BAT_THEME="Nord"
export COLORTERM=truecolor
export STARSHIP_CONFIG="$XDG_CONFIG_HOME/starship/starship.toml"
export WEZTERM_CONFIG_FILE="$XDG_CONFIG_HOME/wezterm/wezterm.lua"
export FZF_DEFAULT_OPTS_FILE="$XDG_CONFIG_HOME/fzf/.fzfrc"
export RUST_BACKTRACE=1

if command -v wezterm &>/dev/null; then
    term="$(command -v wezterm)" 
    export TERMINAL=$term
fi

# initialise environments 
[[ -f "$HOME/.cargo/env" ]] && . "$HOME/.cargo/env"
[[ -f "$HOME/.local/bin/env" ]] && . "$HOME/.local/bin/env"

if [[ -n "$BASH_VERSION" ]]; then
    [[ -r "$HOME/.bashrc" ]] && . "$HOME/.bashrc"
elif [[ -n "$ZSH_VERSION" ]]; then
    [[ -r "$HOME/.zshrc" ]] && . "$HOME/.zshrc"
fi
