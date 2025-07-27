#!/usr/bin/env bash
set -euo pipefail

# This script installs the kew music player (assuming all its dependencies are already installed).

mkdir -p "$HOME"/Apps/kew
gh repo clone ravachol/kew "$HOME"/Apps/kew
cd "$HOME"/Apps/kew || exit
make -j4
sudo make install
make clean
kew path "$HOME"/Media/Music/Vault  # Replace with the path of your music.
