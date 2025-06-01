"""Create symlinks for scripts that are used more than once."""
from pathlib import Path

import utils


def main() -> None:
    path_to_file = Path.home() / Path(".dotfiles/scripts")
    path_to_symlink = Path("/usr/local/bin")
    names_symlink: list[str] = [
            # X11 
            # "feh-background", 
            # "i3-status", 
            # "rofi-run-x11",
            # "switch-display", 
            # Wayland 
            "rofi-run-wayland", 
            "toggle-monitor", 
            # All 
            "adocpre", 
            "remove-kernels", 
            "update-fedora"]
    names_scripts = [name + ".sh" for name in names_symlink]

    utils.create_symlinks(path_to_file, names_scripts, path_to_symlink, names_symlink)


if __name__ == "__main__":
    main()

