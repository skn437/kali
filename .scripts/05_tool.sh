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

  # Watchman
  brew install watchman

  package_install "Devtools"
}

rust_tools() {
  # Cargo Binstall
  brew install cargo-binstall

  # Rust Owl
  cargo binstall rustowl

  # Trunk
  brew install trunk
}

brew_prepare && devtools && rust_tools
