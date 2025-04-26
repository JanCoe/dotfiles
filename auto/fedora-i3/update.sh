#!/bin/bash
        
read -s -p "Enter your sudo password: " pwd
echo

echo "==> Updating DNF packages..."
echo $pwd | sudo -S dnf upgrade --refresh -y

echo "==> Cleaning up DNF..."
echo $pwd | sudo -S dnf autoremove -y
echo $pwd | sudo -S dnf clean all

echo "==> Updating Flatpak apps..."
flatpak update -y

echo "==> Cleaning up unused Flatpak runtimes..."
flatpak uninstall --unused -y

echo "==> Updating Cargo packages..."
cargo install-update --all

echo "=> All updates and cleanup complete!"
