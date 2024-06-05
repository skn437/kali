#!/usr/bin/bash

set -e

apt_prepare() {
  sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y
}

docker() {
  # Set up `apt` repository
  echo "deb [arch=amd64 signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian bookworm stable" | sudo tee /etc/apt/sources.list.d/docker.list

  # Import gpg key
  curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

  # Download "docker-ce-cli", "containerd.io", "docker-ce", "docker-buildx-plugin", "docker-compose-plugin" packages
  apt_prepare
  sudo apt install -y docker-ce-cli
  sudo apt install -y containerd.io
  sudo apt install -y docker-ce
  sudo apt install -y docker-buildx-plugin docker-compose-plugin

  printf "Docker Installed! ✅ \n"
}

reboot() {
  gnome-terminal -- bash -c "printf 'The system needs a reboot to activate the changes! 📚'; printf 'Preparing to reboot... \n'; sleep 2; sudo reboot now"
}

docker && reboot
