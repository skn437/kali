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

  package_install "Devtools"
}

c_cpp() {
  # Clang/LLVM
  brew install llvm

  # CMake
  brew install cmake

  package_install "C/C++"
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

  # Export `Bun.js Binary` to the "Path"
  echo 'export PATH="$HOME/.bun/bin:$PATH"' >>$HOME/.zshrc

  #Prettier
  bun add -g prettier stylelint

  package_install "TypeScript"
}

java() {
  # Maven & Gradle: It automatically installs `OpenJDK` To its latest version
  brew install maven gradle

  # Export `Java Home` to the "Path"
  echo 'export JAVA_HOME="/home/linuxbrew/.linuxbrew/opt/openjdk/libexec"' >>$HOME/.zshrc

  # Add everything to the "Path"
  echo 'export PATH="$JAVA_HOME:$PATH"' >>$HOME/.zshrc

  # Create a maven settings XML file
  mkdir -p $HOME/.m2

  package_install "Java"
}

csharp() {
  # .Net Core
  brew install dotnet

  # Export `.Net Root` to the "Path"
  echo 'export DOTNET_ROOT="$HOME/.dotnet"' >>$HOME/.zshrc

  # .Net Mono
  brew install mono

  # Export `Mono GAC Prefix` to the "Path"
  echo 'export MONO_GAC_PREFIX="/home/linuxbrew/.linuxbrew"' >>$HOME/.zshrc

  # Add everything to the "Path"
  echo 'export PATH="$DOTNET_ROOT:$MONO_GAC_PREFIX:$PATH"' >>$HOME/.zshrc

  package_install "C#"
}

message_broker() {
  # Kafka: It automatically installs `Zookeeper` to its latest version
  brew install kafka

  package_install "Message Broker"
}

kotlin() {
  # Kotlin
  brew install kotlin

  # Ktlint
  brew install ktlint

  package_install "Kotlin"
}

go() {
  #Go
  brew install go

  # Export `Go Root` to the "Path"
  echo 'export GOROOT="/home/linuxbrew/.linuxbrew/opt/go/libexec"' >>$HOME/.zshrc

  # Add everything to the "Path"
  echo 'export PATH="$GOROOT:$PATH"' >>$HOME/.zshrc

  # Go tools
  brew install gopls delve staticcheck

  # Go Task & Lefthook
  brew install go-task lefthook

  package_install "Go"
}

rust() {
  # Rust
  brew install rustup-init

  # SCCache
  brew install sccache

  echo 'export PATH="$HOME/.cargo/bin:$PATH"' >>$HOME/.zshrc

  package_install "Rust"
}

rust_init() {
  # Initialize Rust toolchains
  gnome-terminal -- bash -c "printf 'Preparing to initialize rust... \n' && sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y && rustup-init; read -n 1 KEY"
}

brew_prepare && devtools && c_cpp && shellscript && typescript && java && csharp && message_broker && kotlin && go && rust && rust_init
