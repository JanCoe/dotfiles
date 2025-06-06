"""Create symlinks for config files in dotfiles."""
from pathlib import Path

import utils

def main() -> None:
    path_to_file = Path.home() / Path(".dotfiles")
    path_to_symlink = Path.home()
    names: list[str] = [
        ".aliases", 
        ".bashrc",
        ".gitconfig",
        ".gitignore_global",
        ".ideavimrc",
        ".inputrc",
        ".profile",
        ".tmux.conf"
        ".vimrc",
        ".zoxide.nu",
        ".zshrc",
        ".config/bat/config",
        ".config/fastfetch",  # symlink to the directory
        ".config/gh/config.yml",
        ".config/nushell/config.nu",
        ".config/nushell/env.nu",
        ".config/nvim",  # symlink to the directory
        ".config/rustfmt/rustfmt.toml",
        ".config/starship/starship.toml",
        ".config/wezterm/wezterm.lua", 
        ".config/yazi/yazi.toml",
    ]
    utils.create_symlinks(path_to_file, names, path_to_symlink, names)


if __name__ == "__main__":
    main()

