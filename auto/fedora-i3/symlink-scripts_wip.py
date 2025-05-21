"""Create symlinks for scripts. Work in progress"""
from pathlib import Path

from utils import utils


# (name of symlink, name of script)
scripts: list[str] = ["i3-status", "remove-kernels", "rofi-run", "switch-display", "toggle-monitor", "update"]


def main() -> None:
    for script in scripts:
        script_dir = Path.home() / Path(".dotfiles/auto/fedora-i3/")

        script = script_dir / Path(script + ".sh")
        # symlink = Path("/usr/local/bin") / Path(script)
        symlink = Path.home() / Path("test") / Path(script)

        if symlink.exists():
            symlink.unlink()

        utils.run_shell_command(f"ln -s {script} {symlink}")


if __name__ == "__main__":
    main()

