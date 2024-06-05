#!/usr/bin/bash

set -e

apt_prepare() {
  sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y
}

bluetooth() {
  sudo systemctl enable bluetooth.service
  printf "'Bluetooth' Initialized! ✅ \n"
}

reboot() {
  gnome-terminal -- bash -c "printf 'The system needs a reboot to activate the changes! 📚'; printf 'Preparing to reboot... \n'; sleep 2; sudo reboot now"
}

apt_prepare && bluetooth && reboot
