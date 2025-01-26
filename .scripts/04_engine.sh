#!/usr/bin/bash

set -e

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
  brew install podman

  # Podman Compose
  brew install podman-compose

  package_install "Container Engine"
}

container_engine_init() {
  gnome-terminal -- bash -c "brew services start podman; read -n 1 KEY"
}

brew_prepare && server_engine && container_engine && container_engine_init
