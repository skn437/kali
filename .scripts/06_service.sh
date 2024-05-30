#!/usr/bin/bash

set -e

apt_prepare() {
  sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y
}

brew_prepare() {
  brew update && brew upgrade && brew autoremove && brew cleanup
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

kubernetes() {
  # Minikube & Helm
  brew install minikube helm

  # Initialize Minikube
  minikube start --driver docker

  # Ingress
  minikube addons enable ingress

  message "Kubernetes Installed"
}

apt_prepare && docker && docker_init && brew_prepare && kubernetes
