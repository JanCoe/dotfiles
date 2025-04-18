"""Create symlinks for config files in dotfiles."""

import subprocess
from dataclasses import dataclass
from pathlib import Path

import utils

@dataclass
class Config:
    path: Path
    file: Path

    def __post_init__(self) -> None:
        self.path = Path(self.path)
        self.file = Path(self.file)


links: list[Config] = [
    Config("", ".bash_aliases"),
    Config("", ".bash_profile"),
    Config("", ".bashrc"),
    Config("", ".gitconfig"),
    Config("", ".gitignore_global"),
    Config("", ".ideavimrc"),
    Config("", ".inputrc"),
    #Config("", ".profile"),
    Config("", ".tmux.conf"),
    Config("", ".vimrc"),
    Config("", ".wezterm.lua"),
    Config("", ".zoxide.nu"),
    Config("", ".zshenv"),
    Config("", ".zshrc"),
    Config(".config/gh/", "config.yml"),
    Config(".config/i3/", "config"),
    Config(".config/picom/", "picom.conf"),
    Config(".config/gtk-3.0", "settings.ini") # for gtk themed apps
    Config(".config/gtk-4.0", "settings.ini") # for gtk themed apps
    Config(".config/nushell/", "config.nu"),
    Config(".config/nushell/", "env.nu"),
    Config(".config/", "nvim/"),
    Config(".config/rustfmt/", "rustfmt.toml"),
    Config(".config/", "starship.toml"),
]

def main() -> None:
    for link in links:

        dotfile = Path.home() / Path(".dotfiles") / link.path / link.file
        symlink = Path.home() / link.path / link.file
        
        if symlink.exists():
            symlink.unlink()
       
        symlink_path = Path.home() / link.path
        if not symlink_path.exists():
            utils.run_shell_command(f"mkdir {symlink_path}")

        utils.run_shell_command(f"ln -s {dotfile} {symlink}")

if __name__ == "__main__":
    main()

