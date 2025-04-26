"""Create symlinks for config files in dotfiles."""

from pathlib import Path

from .utils import utils

# symlink: path from $HOME
links: dict[str, str] = {
    ".bashrc": "",
    ".gitconfig": "",
    ".gitignore_global": "",
    ".i3status-nmcli.sh": "",
    ".ideavimrc": "",
    ".inputrc": "",
    ".profile": "",
    ".shell_aliases": "",
    ".tmux.conf": "",
    ".vimrc": "",
    ".wezterm.lua": "",
    ".zoxide.nu": "",
    ".zshrc": "",
    "config.yml": ".config/gh",
    "config": ".config/i3",
    "picom.conf": ".config/picom",
    "settings.ini": ".config/gtk-3.0",  # for gtk themed apps
    "settings.ini": ".config/gtk-4.0",  # for gtk themed apps
    "config.nu": ".config/nushell",
    "env.nu": ".config/nushell",
    "nvim/": ".config",  # symlink to the directory
    "rustfmt.toml": ".config/rustfmt",
    "starship.toml": ".config",
}


if __name__ == "__main__":
    utils.create_symlinks(links)
