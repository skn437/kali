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

  package_install "Devtools"
}

shellscript() {
  # SHFMT
  brew install shfmt

  package_install "Shell Script"
}

typescript() {
  # TypeScript: It automatically installs `Node` & `Python` to their latest versions
  brew install typescript

  # Bun.js
  brew tap oven-sh/bun
  brew install bun

  package_install "TypeScript"
}

java() {
  # Maven & Gradle: It automatically installs `OpenJDK` To its latest version
  brew install maven gradle

  # Export `Java Home` to the "Path"
  echo 'export JAVA_HOME="/home/linuxbrew/.linuxbrew/opt/openjdk/libexec/"' >>$HOME/.zshrc

  # Create a maven settings XML file
  mkdir -p $HOME/.m2

  package_install "Java"
}

rust() {
  # Rust
  brew install rust

  # Rustfmt & SCCache
  brew install rustfmt sccache

  package_install "Rust"
}

go() {
  #Go
  brew install go

  # Go tools
  brew install gopls delve staticcheck

  # Go Task & Lefthook
  brew install go-task lefthook

  package_install "Go"
}

kotlin() {
  # Kotlin
  brew install kotlin

  # Ktlint
  brew install ktlint

  package_install "Kotlin"
}

brew_prepare && devtools && shellscript && typescript && java && rust && go && kotlin
