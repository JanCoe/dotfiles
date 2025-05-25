#!/bin/bash

# This script creates a toolbox called 'music' and installs kew into it.

# Create a toolbox and enter it.
toolbox new music
toobox enter music

# Install dependencies.
sudo dnf install -y pkg-config taglib-devel fftw-devel opus-devel opusfile-devel libvorbis-devel libogg-devel git gcc make chafa-devel libatomic gcc-c++ glib2-devel
sudo dnf install -y aplay # brings in alsa-utils, alsa-lib, also-ucm, libsamplerate

# Activate RPM fusion and install a package from there for AAC and mp4
sudo dnf install -y https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install -y faad2-devel

# Create a directory for the app and install it there
mkdir -p ~/Apps/kew
git clone https://github.com/ravachol/kew.git ~/Apps/kew
cd ~/Apps/kew
make -j4
sudo make install

export PIPEWIRE_REMOTE=pipewire-0  # not sure if this is needed. Installing aplay might have done it.

# Set directory of music and exit 
kew path ~/Media/music/Vault  # assuming that is where the music collection is mounted.
exit
