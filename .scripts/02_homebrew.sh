#!/usr/bin/bash

set -e

apt_prepare() {
  sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y
}

homebrew() {
  # Homebrew
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  # Add `Homebrew` to the "Path"
  test -d $HOME/.linuxbrew && eval "$($HOME/.linuxbrew/bin/brew shellenv)"
  test -d /home/linuxbrew/.linuxbrew && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
  echo "eval \"\$($(brew --prefix)/bin/brew shellenv)\"" >>$HOME/.zshrc
}

BREW_PATH="/home/linuxbrew"

if test -d "${BREW_PATH}"; then
  sudo rm -rf "${BREW_PATH}"
fi

apt_prepare && homebrew

printf "Homebrew Installed ✅ \n"
