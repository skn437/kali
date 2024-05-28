#!/usr/bin/bash

set -e

package_install() {
  printf "'%s' Installed! ✅ \n" "$1"
}

docker() {
  # Docker
  curl -sSL https://get.docker.com | bash

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
