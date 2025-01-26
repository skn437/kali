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

server_engine() {
  # NGINX
  brew install nginx

  # Turso DB
  brew install tursodatabase/tap/turso

  package_install "Server Engine"
}

container_engine() {
  # Podman
  sudo apt install -y podman

  # Podman Compose
  brew install podman-compose

  # Export Podman to Path
  echo 'export PATH="/usr/bin:$PATH"' >>"$HOME/.zshrc"

  package_install "Container Engine"
}

apt_prepare && brew_prepare && server_engine && container_engine
