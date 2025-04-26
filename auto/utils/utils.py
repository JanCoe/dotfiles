import getpass
import subprocess
from pathlib import Path

def get_password() -> str:
    return getpass.getpass(prompt="Enter your sudo password: ")


def run_shell_command(command: str) -> None:
    subprocess.run(command, shell=True, check=True)


def run_sudo_command(command: str, pwd: str) -> None:
    try:
        print(f"Running: {command}")
        run_shell_command(f"echo {pwd} | sudo -S {command}")
        print(f"Successfully ran: {command}")
    except subprocess.CalledProcessError:
        print(f"Failed to run command: {command}")


def run_command(command: str, pwd: str | None = None) -> None:
    if pwd is None:
        subprocess.run(command, check=True)
    else:
        run_sudo_command(command, pwd)


def run_commands(command: str, packages: list[str], pwd: str | None = None) -> None:
    for pkg in packages:
        run_command(f"{command} {pkg}", pwd)


def create_symlinks(links: dict[str, str]) -> None:
    """Create symlinks for a dictionary of links.

    :param links: dictionary of the name of the symlink and the path relative to $HOME.
    :return None
    """
    for k, v in links.items():
        link = Path(k)
        path = Path(v)
        home = Path.home()
        dotfiles = Path(".dotfiles")

        dotfile = home / dotfiles / path / link
        symlink = home / path / link

        if symlink.exists():
            symlink.unlink()

        if not (symlink_path := home / path).exists():
            run_shell_command(f"mkdir {symlink_path}")

        run_shell_command(f"ln -s {dotfile} {symlink}")

