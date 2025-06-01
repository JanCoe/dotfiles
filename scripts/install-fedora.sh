#!/bin/bash

PKG_COPR=(
  wezfurlong/wezterm-nightly 
  rubemlrm/nordzy-icon # for nordic theme
  lihaohong/yazi
)
PKG_DNF=(
    @development-tools
    cmake
    openssl-devel  # needed for cargo-update
    # fuse-libs  # needed explicitly? needed for Jetbrains, not done yet 
    # libxcrypt-compat  # needed for Synology HyperBackupExplorer, not done yet
    # fonts and themes
    ibm-plex-serif-fonts 
    ibm-plex-sans-fonts
    rsms-inter-fonts
    jetbrains-mono-fonts
    papirus-icon-theme
    nordzy-icon
    # i3 only 
    picom  # compositor for i3
    # rest 
    flatpak
    # CLI utils 
    wezterm
    uutils-coreutils
    fastfetch
    bat
    fd
    tldr
    htop
    fzf
    yazi 
    git-lfs
    gh
    zoxide
    tmux
    zsh
    # development utils
    uv
    ruff
    neovim
    asciidoctor
    nushell
    # applications 
    cheese
    neomutt
    thunderbird
    vlc
    toolbox
    onedrive
)
PKG_CARGO=(
    cargo-update
    dua 
    du-dust
    hyperfine
    starship
    tokei
)
FLATPAKS=(
    ch.protonmail.protonmail-bridge
    com.vivaldi.Vivaldi
    md.obsidian.Obsidian
    us.zoom.Zoom
)

read -s -p "Enter your sudo password: " pwd
echo

echo "==> Refreshing Fedora..."
echo $pwd | sudo -S dnf upgrade --refresh -y

# Do this step manually.
echo "==> Adding nushell to repo..."
config_text="[gemfury-nushell]
name=Gemfury Nushell Repo
baseurl=https://yum.fury.io/nushell/
enabled=1
gpgcheck=0
gpgkey=https://yum.fury.io/nushell/gpg.key"
echo "$config_text" | sudo tee /etc/yum.repos.d/fury-nushell.repo

echo "==> Enabling COPR packages..."
echo $pwd | sudo -S dnf copr enable "${PKG_COPR[@]}"

echo "==> Installing DNF packages..."
echo $pwd | sudo -S dnf install -y "${PKG_DNF[@]}"

echo "==> Installing Rust..."
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
. $HOME/.cargo/env

echo "==> Installing cargo packages..."
cargo install "${PKG_CARGO[@]}"

echo "==> Add flathub to repo..."
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

echo "==> Installing Flathub packages..."
flatpak install flathub "${FLATPAKS[@]}"

# i3 only
echo "==> Installing lockscreen..." 
cd ~/Downloads
git clone https://github.com/meskarune/i3lock-fancy.git
cd i3lock-fancy
sudo make install

# i3 only
echo "==> Setting background..."
feh --bg-scale ~/.dotfiles/backgrounds/touhou_anime.jpg
