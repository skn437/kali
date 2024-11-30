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

  # Deno
  brew install deno

  # Prettier, StyleLint
  brew install prettier
  bun add -g prettier
  bun add -g stylelint postcss-html postcss-scss
  bun add -g stylelint-config-standard stylelint-config-standard-scss stylelint-config-html

  # Export `Bun.js Binary` to the "Path"
  echo 'export PATH="$HOME/.bun/bin:$PATH"' >>$HOME/.zshrc

  STYLELINT_LOCATION="$HOME/.bun/install/global"

  if test -d "$STYLELINT_LOCATION"; then
    cd "$STYLELINT_LOCATION"
    curl -sSL "https://raw.githubusercontent.com/skn437/kali/master/.project/editor.sh" | bash -s -- -ps
    curl -sSL "https://raw.githubusercontent.com/skn437/kali/master/.project/ignore.sh" | bash -s -- -ps
    cd "$HOME"
  fi

  package_install "TypeScript"
}

java() {
  # Maven & Gradle: It automatically installs `OpenJDK` To its latest version
  brew install maven gradle

  # Open JDK 21
  brew install openjdk@21

  # Export `Java Home` to the "Path"
  echo 'export JAVA_HOME="$HOME/.jdks/corretto-21.0.5"' >>$HOME/.zshrc

  # Add everything to the "Path"
  echo 'export PATH="$JAVA_HOME/bin:$PATH"' >>$HOME/.zshrc

  # Create a maven settings directory
  mkdir -p $HOME/.m2

  # Create a gradle settings directory
  mkdir -p $HOME/.gradle

  package_install "Java"
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

  # Go Task, Lefthook & Go Releaser
  brew install go-task lefthook goreleaser

  package_install "Go"
}

csharp() {
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

csharp_init() {
  # Delete Existing .Net (If Present)
  gnome-terminal -- bash -c "printf 'Preparing to initialize csharp... \n' && sudo rm -rfv /usr/share/dotnet; read -n 1 KEY"
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

brew_prepare && devtools && shellscript && typescript && java && message_broker && kotlin && go && csharp && csharp_init
