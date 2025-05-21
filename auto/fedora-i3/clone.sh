#!/bin/bash

read -s -p "Enter your sudo passward: " pwd
echo

echo "==> Updating DNF packages..."
echo $pwd | sudo -S dnf upgrade --refresh

echo "==> Installing github authorisation..."
echo $pwd | sudo dnf install gh -y
gh auth login

echo "==> Cloning dotfiles repo..."
git clone git@github.com:JanCoe/dotfiles.git ~/.dotfiles
