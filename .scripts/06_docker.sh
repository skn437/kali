#!/usr/bin/bash

set -e

apt_prepare() {
  sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y
}

message() {
  printf "%s! ✅ \n" "$1"
}

docker() {
  # Download "docker-ce-cli", "containerd.io", "docker-ce", "docker-buildx-plugin", "docker-compose-plugin" packages
  curl -sSL https://get.docker.com | bash

  message "Docker Installed"
}

docker_init() {
  # Create a `Docker Group` and add linux username to it
  sudo usermod -aG docker $USER && newgrp docker

  message "Docker Group Enabled"
}

reboot() {
  gnome-terminal -- bash -c "printf 'The system needs a reboot to activate the changes! 📚'; printf 'Preparing to reboot... \n'; sleep 2; sudo reboot now"
}

apt_prepare && docker && docker_init && reboot
