#!/usr/bin/bash

set -e

docker_init() {
  # Create a `Docker Group` and add linux username to it
  sudo usermod -aG docker $USER && newgrp docker

  printf "Docker Group Enabled! ✅ \n"
}

reboot() {
  gnome-terminal -- bash -c "printf 'The system needs a reboot to activate the changes! 📚'; printf 'Preparing to reboot... \n'; sleep 2; sudo reboot now"
}

docker_init && reboot
