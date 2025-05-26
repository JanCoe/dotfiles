"""Create symlinks for config files in dotfiles."""
from pathlib import Path

from . import utils

def main() -> None:
    path_to_file = Path.home() / Path(".dotfiles")
    path_to_symlink = Path.home()
    names: list[str] = [
        ".bashrc", ".gitconfig", ".gitignore_global", ".ideavimrc", ".inputrc", ".profile", ".aliases", 
        ".tmux.conf", ".vimrc", ".Xresources", ".zoxide.nu", ".zshrc", ".config/starship.toml",
        ".config/bat/config", ".config/gh/config.yml", ".config/i3/config", ".config/i3status/config",
        ".config/gtk-3.0/settings.ini",  # for gtk themed apps
        ".config/gtk-4.0/settings.ini",  # for gtk themed apps
        ".config/hypr/hyprland.conf",
        ".config/nushell/config.nu",
        ".config/nushell/env.nu",
        ".config/picom/picom.conf",
        ".config/rofi/config.rasi",
        ".config/rustfmt/rustfmt.toml",
        ".config/starship/starship.toml",
        ".config/waybar/config.jsonc", 
        ".config/waybar/style.css", 
        ".config/wezterm/wezterm.lua", 
        ".config/yazi/yazi.toml",
        ".config/fastfetch/",  # symlink to the directory
        ".config/nvim/",  # symlink to the directory
    ]
    utils.create_symlinks(path_to_symlink, names, path_to_file, names)


if __name__ == "__main__":
    main()
