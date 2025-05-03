#!/bin/bash

PKG_COPR=(
  wezfurlong/wezterm-nightly
  rubemlrm/nordzy-icon # for nordic theme
)
PKG_DNF=(
    @development-tools
    openssl
    cmake
    fuse-libs  # needed for Jetbrains 
    jetbrains-mono-fonts
    papirus-icon-theme
    picom
    flatpak
    fastfetch
    tldr
    htop
    fzf
    git-lfs
    gh
    zoxide
    tmux
    zsh
    uv
    ruff
    neovim
    wezterm
    nushell
    neomutt
    thunderbird
    vlc
    toolbox
    onedrive
)
PKG_CARGO=(
    starship
    cargo-update
)
FLATPAKS=(
    ch.protonmail.protonmail-bridge
    app.zen_browser.zen
    md.obsidian.Obsidian
)

read -s -p "Enter your sudo password: " pwd
echo

echo "==> Refreshing Fedora..."
echo $pwd | sudo -S dnf upgrade --refresh -y

echo "==> Adding nushell to repo..."  # do this step manually
config_text="[gemfury-nushell]
name=Gemfury Nushell Repo
baseurl=https://yum.fury.io/nushell/
enabled=1
gpgcheck=0
gpgkey=https://yum.fury.io/nushell/gpg.key"
echo "$config_text" | sudo tee /etc/yum.repos.d/fury-nushell.repo

echo "==> Enabling COPR packages..."
for pkg in ${PKG_COPR[@]}; do
    echo "Enabling: $pkg"
    echo $pwd | sudo -S dnf copr enable "$pkg"
done

echo "==> Installing DNF packages..."
for pkg in ${PKG_DNF[@]}; do
    echo "Installing: $pkg"
    echo $pwd | sudo -S dnf install -y "$pkg"
done

echo "==> Installing Rust and updating to latest."
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
rustup 

echo "==> Installing cargo packages..."
for pkg in ${PKG_CARGO[@]}; do
    echo "Installing: $pkg"
    cargo install "$pkg"
done

echo "==> Add flathub to repo..."
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

echo "==> Installing Flathub packages..."
for pkg in ${FLATPAKS[@]}; do
    echo "Installing: $pkg"
    flatpak install flathub "$pkg"
done

echo "==> Installing lockscreen..."
cd ~/Downloads
git clone https://github.com/meskarune/i3lock-fancy.git
cd i3lock-fancy
sudo make install

echo "==> Setting background..."
feh --bg-scale ~/.dotfiles/backgrounds/touhou_anime.jpg
