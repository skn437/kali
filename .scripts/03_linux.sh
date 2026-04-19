#!/usr/bin/bash

set -e

brew_prepare() {
  brew update && brew upgrade && brew autoremove && brew cleanup
}

package_install() {
  printf "'%s' Installed! ✅ \n" "$1"
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

  # Shell Check
  brew install shellcheck

  package_install "Shell Script"
}

typescript() {
  # TypeScript: It automatically installs `Node` & `Python` to their latest versions
  brew install typescript

  # Node.js 24
  brew install node@24

  # Export `Node.js 24` Binary to the "Path"
  echo 'export PATH="/home/linuxbrew/.linuxbrew/opt/node@24/bin:$PATH"' >>"$HOME/.zshrc"

  # Bun.js
  brew tap oven-sh/bun
  brew install bun

  # Export `Bun.js Binary` to the "Path"
  echo 'export PATH="$HOME/.bun/bin:$PATH"' >>"$HOME/.zshrc"

  # Prettier, Concurrently
  brew install prettier
  bun add -g concurrently

  package_install "TypeScript"
}

java() {
  # Maven & Gradle: It automatically installs `OpenJDK` To its latest version
  brew install maven gradle

  # Open JDK 21
  brew install openjdk@21

  # Export `Java Home` to the "Path"
  echo 'export JAVA_HOME="/home/linuxbrew/.linuxbrew/opt/openjdk@21/libexec"' >>"$HOME/.zshrc"

  # Add everything to the "Path"
  echo 'export PATH="$JAVA_HOME/bin:$PATH"' >>"$HOME/.zshrc"

  # Create a maven settings directory
  mkdir -p "$HOME/.m2"

  # Create a gradle settings directory
  mkdir -p "$HOME/.gradle"

  package_install "Java"
}

kotlin() {
  # Kotlin
  brew install kotlin

  # Ktlint
  brew install ktlint

  package_install "Kotlin"
}

go() {
  # Go
  brew install go

  # Export `Go Root` to the "Path"
  echo 'export GOROOT="/home/linuxbrew/.linuxbrew/opt/go/libexec"' >>"$HOME/.zshrc"

  # Add everything to the "Path"
  echo 'export PATH="$GOROOT:$PATH"' >>"$HOME/.zshrc"

  # Go tools
  brew install gopls delve staticcheck

  # Go Task, Lefthook & Go Releaser
  brew install go-task lefthook goreleaser

  package_install "Go"
}

rust() {
  # Initialize Rust Toolchains
  gnome-terminal -- bash -c "printf 'Preparing to initialize rust... \n' && sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y && curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh && echo 'Rust Installed!'; read -n 1 KEY"

  # SCCache
  brew install sccache

  # Add "Rust Binaries" to the "Path"
  echo 'export PATH="$HOME/.cargo/bin:$PATH"' >>"$HOME/.zshrc"

  package_install "Rust"
}

brew_prepare && c_cpp && shellscript && typescript && java && kotlin && go && rust
