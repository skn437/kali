#!/usr/bin/bash

set -e

brew_prepare() {
  brew update && brew upgrade && brew autoremove && brew cleanup
}

package_install() {
  printf "'%s' Installed! ✅ \n" "$1"
}

devtools() {
  # Fastfetch
  brew install fastfetch

  # YQ & XMLStarlet
  brew install yq xmlstarlet

  # Dive
  brew install dive

  # Package Config
  brew install pkgconf

  package_install "Devtools"
}

rust_owl() {
  # Install Rust Owl
  gnome-terminal -- bash -c "printf 'Preparing to initialize rust owl... \n' && curl -L 'https://github.com/cordx56/rustowl/releases/latest/download/install.sh' | sh && echo 'Rust Owl Installed!'; read -n 1 KEY"
}

message_broker() {
  # Kafka: It automatically installs `Zookeeper` to its latest version
  brew install kafka

  package_install "Message Broker"
}

brew_prepare && devtools && rust_owl && message_broker
