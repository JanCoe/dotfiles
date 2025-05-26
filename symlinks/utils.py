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


def create_symlinks(path_symlink: Path, names_symlink: list[str], path_file: Path, names_file: list[str]) -> None:
    """Create symlinks for a list of file or directory names.

    :param path_symlink: path of where the symlink would be created 
    :parm names_symlink: list of names of the symlinks
    :param path_file: path of the file or directory to which a symlink will be created
    :parm names_file: list of names of the file or directory to which a symlink will be created
    :return None
    """
    if not path_symlink.exists():
        run_shell_command(f"mkdir -p {path_symlink}")

    for name_symlink, name_file in zip(names_symlink, names_file):
        symlink = path_symlink / Path(name_symlink)
        file = path_file / Path(name_file)

        if symlink.exists():
            run_shell_command(f"ln -s --force {symlink} {file}")
        else:
            run_shell_command(f"ln -s {symlink} {file}")

