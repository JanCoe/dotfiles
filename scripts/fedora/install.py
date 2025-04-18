import utils

packages_copr: list[str] = ["wezfurlong/wezterm-nightly",
                            "rubemlrm/nordzy-icon" # for nordic theme
                            ]
packages_lib: list[str] = [
    "@development-tools",
    "openssl",
    "cmake",
    "fuse-lib", # for wezterm
    "jetbrains-mono-fonts",
    "nordzy-icon-theme",
    "papirus-icon-theme"
]
packages_dnf: list[str] = [
    "fastfetch",
    "tldr",
    "htop",
    "fzf",
    "git-lfs",
    "gh",
    "zoxide",
    "tmux",
    "zsh",
    "uv",
    "ruff",
    "neovim",
    "wezterm",
    "nushell",
    "neomutt",
    "thunderbird",
    "vlc",
]
packages_flat: list[str] = [
    "ch.protonmail.protonmail-bridge",
    "app.zen_browser.zen",
    "md.obsidian.Obsidian",
]
packages_cargo: list[str] = ["starship", "cargo-update"]


def main() -> None:
    pwd = utils.get_password()

    utils.run_command("dnf upgrade --refresh", pwd)

    # Add nushell to repo.
    config_text = """[gemfury-nushell]
name=Gemfury Nushell Repo
baseurl=https://yum.fury.io/nushell/
enabled=1:
gpgcheck=0
gpgkey=https://yum.fury.io/nushell/gpg.key"""
    utils.run_shell_command(
        f"echo {config_text} | sudo tee /etc/yum.repos.d/fury-nushell.repo"
    )

    # Install packages and libraries from dnf.
    utils.run_commands("dnf copr enable", packages_copr, pwd)
    utils.run_commands("dnf install", packages_lib + packages_dnf, pwd)

    # Install Rust, update to latest and install cargo packages.
    utils.run_shell_command("curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh")
    utils.run_command("rustup") 
    utils.run_commands("cargo install", packages_cargo)

    # Add flathub to repo and install flatpaks.
    utils.run_command(
        "flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo"
    )
    utils.run_commands("flatpak install flathub", packages_flat)

    # A nicer lock screen.
    utils.run_command(f"cd {Path.home().joinpath('Downloads')}")
    utils.run_command("git clone https://github.com/meskarune/i3lock-fancy.git")
    utils.run_command("cd i3lock-fancy")
    utils.run_command("sudo make install")

    # Set background 
    utils.run_command("feh --bg-scale ~/.dotfiles/background/dark-anime.jpg")


if __name__ == "__main__":
    main()

