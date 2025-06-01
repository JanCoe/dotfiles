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
        # run_shell_command(f"echo {pwd} | sudo -S {command}")
        print(f"echo {pwd} | sudo -S {command}")
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


def create_symlinks(path_file: Path, names_file: list[str], path_symlink: Path, names_symlink: list[str]) -> None:
    """Create symlinks for a list of file or directory names.

    :param path_file: path of the file or directory to which a symlink will be created
    :parm names_file: list of names of the file or directory to which a symlink will be created
    :param path_symlink: path of where the symlink would be created 
    :parm names_symlink: list of names of the symlinks
    :return None
    """
    pwd = get_password() 

    if not path_symlink.exists():
        run_shell_command(f"mkdir -p {path_symlink}")

    for name_file, name_symlink in zip(names_file, names_symlink):
        file = path_file / Path(name_file)
        symlink = path_symlink / Path(name_symlink)

        if symlink.exists():
            run_sudo_command(f"ln -s --force {file} {symlink}", pwd)
        else:
            run_sudo_command(f"ln -s {file} {symlink}", pwd)

