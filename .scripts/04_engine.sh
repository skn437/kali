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

  # Kafka: It automatically installs `Zookeeper` to its latest version
  brew install kafka

  package_install "Server Engine"
}

brew_prepare && server_engine
