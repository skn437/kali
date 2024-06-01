#!/usr/bin/bash

set -e

brew_prepare() {
  brew update && brew upgrade && brew autoremove && brew cleanup
}

kubernetes() {
  # Minikube & Helm
  brew install minikube helm

  # Initialize Minikube
  minikube start --driver docker

  # Ingress
  minikube addons enable ingress

  printf "'Kubernetes' Installed! ✅ \n"
}

brew_prepare && kubernetes
