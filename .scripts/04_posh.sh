#!/usr/bin/bash

set -e

package_install() {
  printf "'%s' Installed! ✅ \n" "$1"
}

oh_my_posh() {
  # Check if environment variable `$TERM` is set to `xterm-256color` or not
  printf "TERM = %s \n" "$(echo $TERM)"

  # Install "Oh My Posh"
  brew install oh-my-posh
}

oh_my_posh_init() {
  # Install "FiraCode font"
  oh-my-posh font install

  # Get your current shell
  printf "SHELL = %s \n" "$(oh-my-posh get shell)"

  # Install theme
  echo 'eval "$(oh-my-posh init zsh --config $(brew --prefix oh-my-posh)/themes/kali.omp.json)"' >>~/.zshrc
}

oh_my_posh

printf "\n"

oh_my_posh_init

package_install "Oh My Posh"
