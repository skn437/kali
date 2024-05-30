#!/usr/bin/bash

set -e

apt_prepare() {
  sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y
}

brew_prepare() {
  brew update && brew upgrade && brew autoremove && brew cleanup
}

package_install() {
  printf "'%s' Installed! ✅ \n" "$1"
}

docker_key() {
  # Set up the `apt` repository
  echo "deb [arch=amd64 signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian bookworm stable" | sudo tee /etc/apt/sources.list.d/docker.list

  # Import the `gpg` key
  curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

  package_install "Docker Key"
}

docker() {
  # Download "docker-ce-cli", "containerd.io", "docker-ce", "docker-buildx-plugin", "docker-compose-plugin" packages
  sudo apt install -y docker-ce-cli containerd.io docker-ce docker-buildx-plugin docker-compose-plugin

  package_install "Docker"
}

docker_init() {
  # Create a `Docker Group` and add linux username to it
  sudo usermod -aG docker $USER && newgrp docker

  package_install "Docker Group"
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

docker_key && apt_prepare && docker && docker_init && brew_prepare && kubernetes
