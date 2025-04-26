"""Create symlinks for config files in dotfiles."""

from pathlib import Path

from .utils import utils

# symlink: path from $HOME
links: dict[str, str] = {
    ".gitconfig": "",
    ".gitignore_global": "",
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
    "config.nu": ".config/nushell",
    "env.nu": ".config/nushell",
    "nvim/": ".config",  # symlink to the directory
    "rustfmt.toml": ".config/rustfmt",
    "starship.toml": ".config",
}


if __name__ == "__main__":
    utils.create_symlinks(links)
