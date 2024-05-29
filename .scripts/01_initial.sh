#!/usr/bin/bash

set -e

apt_prepare {
  sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y
}

main_package() {
  sudo apt install -y curl build-essential git gnome-tweaks zsh
}

zsh() {
  # Get `zsh` version
  printf "zsh version: %s \n" "$(zsh --version)"

  # Initialize `zsh`
  zsh

  # Make `zsh` as default shell
  chsh -s "$(which zsh)"

  # Check current active shell
  printf "Current shell: %s \n" $SHELL
}

apt_prepare && main_package && zsh && printf "Main Packages Installed! ✅ \n"
