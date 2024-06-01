#!/usr/bin/bash

set -e

apt_prepare() {
  sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y
}

main_package() {
  # `curl`, `git`, `build-essential`, `gnome-tweaks` & `zsh`
  sudo apt install -y curl git build-essential gnome-tweaks zsh
  
  printf "'Main Packages' Installed! ✅ \n"
}

zsh_init() {
  # Initialize `zsh`
  gnome-terminal -- bash -c "printf 'zsh version: %s \n' '$(zsh --version)'; zsh; chsh -s '$(which zsh)'; printf 'Zsh Initialized! ✅ \n'"
}

reboot() {
  gnome-terminal -- bash -c "printf 'The system needs a reboot to activate the changes. Complete zsh initialization properly. \n'; printf 'Preparing to reboot... \n'; sleep 2; sudo reboot now"
}

apt_prepare && main_package && zsh_init && reboot
