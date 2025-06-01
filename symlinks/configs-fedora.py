"""Create symlinks for config files in dotfiles."""
from pathlib import Path

import utils

def main() -> None:
    path_to_file = Path.home() / Path(".dotfiles")
    path_to_symlink = Path.home()
    names: list[str] = [
        # X11
        # ".Xresources",
        # ".config/i3/config",
        # ".config/i3status/config",
        # ".config/picom/picom.conf",
        # Wayland
        ".config/hypr/hyprland.conf",
        ".config/waybar/config.jsonc", 
        ".config/waybar/style.css", 
        # All
        # ".bashrc",
        # ".gitconfig", 
        # ".gitignore_global", 
        # ".ideavimrc",
        # ".inputrc",
        # ".profile",
        # ".aliases", 
        # ".tmux.conf",
        # ".vimrc",
        # ".zoxide.nu",
        # ".zshrc",
        ".config/bat/config",
        ".config/gh/config.yml",
        ".config/gtk-3.0/settings.ini",  # for gtk themed apps
        ".config/gtk-4.0/settings.ini",  # for gtk themed apps
        ".config/nushell/config.nu",
        ".config/nushell/env.nu",
        ".config/rofi/config.rasi",
        ".config/rustfmt/rustfmt.toml",
        ".config/starship/starship.toml",
        ".config/wezterm/wezterm.lua", 
        ".config/yazi/yazi.toml",
        ".config/fastfetch/",  # symlink to the directory
        ".config/nvim/",  # symlink to the directory
    ]
    utils.create_symlinks(path_to_file, names, path_to_symlink, names)


if __name__ == "__main__":
    main()
