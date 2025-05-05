"""Create symlinks for config files in dotfiles."""

from auto.utils import utils

# (path from $HOME, symlink)
links: list[tuple[str, str]] = [
    ("", ".bashrc"),
    ("", ".gitconfig"),
    ("", ".gitignore_global"),
    ("", ".ideavimrc"),
    ("", ".inputrc"),
    ("", ".profile"),
    ("", ".shell_aliases"),
    ("", ".tmux.conf"),
    ("", ".vimrc"),
    ("", ".zoxide.nu"),
    ("", ".zshrc"),
    (".config", "starship.toml"),
    (".config/gh", "config.yml"),
    (".config/nushell", "config.nu"),
    (".config/nushell", "env.nu"),
    (".config", "nvim/"),  # symlink to the directory
    (".config/rustfmt", "rustfmt.toml"),
    (".config/wezterm", "wezterm.lua"), 
]


if __name__ == "__main__":
    utils.create_symlinks(links)
