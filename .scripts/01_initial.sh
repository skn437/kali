#!/usr/bin/bash

set -e

apt_prepare {
  sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y
}

main_package() {
  sudo apt install -y curl build-essential git gnome-tweaks
}

apt_prepare && main_package && printf "Main Packages Installed! ✅ \n"
