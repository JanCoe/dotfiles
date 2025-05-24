
"""Create symlinks for config files in dotfiles."""
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
    (".config", "starship.toml"),
    (".config/bat", "config",),
    (".config/fastfetch", "config.jsonc",),
    (".config/fastfetch", "detroit.txt",),
    (".config/gh", "config.yml"),
    (".config/i3", "config",),
    (".config/i3status", "config"),
    (".config/gtk-3.0", "settings.ini"),  # for gtk themed apps
    (".config/gtk-4.0", "settings.ini"),  # for gtk themed apps
    (".config/hypr", "hyprland.conf"),
    (".config/nushell", "config.nu"),
    (".config/nushell", "env.nu"),
    (".config/picom", "picom.conf"),
    (".config/rofi", "config.rasi"),
    (".config/rustfmt", "rustfmt.toml"),
    (".config/waybar", "config.jsonc"), 
    (".config/waybar", "style.css"), 
    (".config/wezterm", "wezterm.lua"), 
    (".config/yazi", "yazi.toml"),
    (".config", "nvim/"),  # symlink to the directory
]


if __name__ == "__main__":
    utils.create_symlinks(links)
