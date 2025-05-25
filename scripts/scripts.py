"""Create symlinks for scripts. Work in progress"""
from pathlib import Path

from . import utils


def main() -> None:
    path_to_symlink = Path("/usr/local/bin")
    path_to_file = Path.home() / Path(".dotfiles/scripts")
    names_symlink: list[str] = ["feh-background", "i3-status", "remove-kernels", "rofi-run-wayland", "rofi-run-x11",
                          "switch-display", "toggle-monitor", "update-fedora"]
    names_scripts = [name.join(".sh") for name in names_symlink]

    utils.create_symlinks(path_to_symlink, names_symlink, path_to_file, names_scripts) 


if __name__ == "__main__":
    main()

