import getpass
import subprocess


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

