#!/bin/bash
        
read -s -p "Enter your sudo password: " pwd
echo
echo

echo "==> Updating DNF packages..."
echo $pwd | sudo -S dnf upgrade --refresh -y

echo
echo "==> Cleaning up DNF..."
echo $pwd | sudo -S dnf autoremove -y
echo $pwd | sudo -S dnf clean all

echo
echo "==> Updating Flatpak apps..."
flatpak update -y

echo
echo "==> Cleaning up unused Flatpak runtimes..."
flatpak uninstall --unused -y

echo 
echo "==> Updating Cargo packages..."
cargo install-update --all

echo
echo "==> All updates and cleanup complete!"

echo
echo "==> Checking if reboot is required..."
needs-restarting -r
