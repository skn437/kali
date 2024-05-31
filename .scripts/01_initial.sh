#!/usr/bin/bash

set -e

message() {
  printf "%s! ✅ \n" "$1" 
}

apt_prepare() {
  sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y
}

main_package() {
  # `curl`, `git`, `build-essential`, `gnome-tweaks` & `zsh`
  sudo apt install -y curl git build-essential gnome-tweaks zsh
  
  message "'Main Packages' Installed"
}

zsh_init() {
  # Initialize `zsh`
  gnome-terminal -- bash -c "printf 'zsh version: %s \n' '$(zsh --version)'; zsh; message 'Zsh Initialized'; read -n 1 KEY"
}

zsh() {
  # Change default shell to `zsh`
  gnome-terminal -- bash -c "chsh -s '$(which zsh)'; message 'Changed default shell to Zsh'; read -n 1 KEY"
}

apt_prepare && main_package && zsh_init && zsh
