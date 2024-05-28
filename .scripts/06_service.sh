#!/usr/bin/bash

set -e

package_install() {
  printf "'%s' Installed! ✅ \n" "$1"
}

docker() {
  # Set up the `APT` repository
  echo "deb [arch=amd64 signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian bookworm stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list

  # Import the `GPG` key
  curl -fsSL https://download.docker.com/linux/debian/gpg |
  sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

  # Download "docker-ce-cli", "containerd.io", "docker-ce", "docker-buildx-plugin", "docker-compose-plugin" packages
  sudo apt install -y docker-ce-cli containerd.io docker-ce docker-buildx-plugin docker-compose-plugin

  # Create a `Docker Group` and add linux username to it
  sudo usermod -aG docker $USER && newgrp docker

  package_install "Docker"
}

kubernetes() {
  # Minikube & Helm
  brew install minikube helm

  # Initialize Minikube
  minikube start --driver docker

  # Ingress
  minikube addons enable ingress

  package_install "Kubernetes"
}

docker && kubernetes
