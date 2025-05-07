"""Create symlinks for config files in dotfiles."""

from pathlib import Path

from utils import utils

# (path from $HOME, file or directory)
links: list[tuple[str, str]] = [
    ("", ".bashrc"),
    ("", ".gitconfig"),
    ("", ".gitignore_global"),
    ("", ".ideavimrc"),
    ("", ".inputrc"),
    ("", ".profile"),
    ("", ".shell_aliases"),
    ("", ".tmux.conf"),
    ("", ".vimrc"),
    ("", ".Xresources"),
    ("", ".zoxide.nu"),
    ("", ".zshrc"),
    (".config/i3", "config",),
    (".config/i3status", "config"),
    (".config/rofi", "config.rasi"),
    (".config/gh", "config.yml"),
    (".config/picom", "picom.conf"),
    (".config/gtk-3.0", "settings.ini"),  # for gtk themed apps
    (".config/gtk-4.0", "settings.ini"),  # for gtk themed apps
    (".config/nushell", "config.nu"),
    (".config/nushell", "env.nu"),
    (".config/wezterm", "wezterm.lua"), 
    (".config/rustfmt", "rustfmt.toml"),
    (".config/yazi", "yazi.toml"),
    (".config", "nvim/"),  # symlink to the directory
    (".config", "starship.toml"),
]


if __name__ == "__main__":
    utils.create_symlinks(links)
