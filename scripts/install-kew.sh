#!/bin/bash

# This script installs the kew music player (assuming all its dependencies are already installed).

mkdir -p ~/Apps/kew
git clone https://github.com/ravachol/kew.git ~/Apps/kew
cd ~/Apps/kew || exit
make -j4
sudo make install
make clean
kew path ~/Media/music/Vault # Replace with the path of your music.
