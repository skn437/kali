#!/usr/bin/bash

set -e

docker_init() {
  # Create a `Docker Group` and add linux username to it
  sudo usermod -aG docker $USER && newgrp docker

  printf "Docker Group Enabled! ✅ \n"
}

docker_init
