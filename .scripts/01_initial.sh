#!/usr/bin/bash

set -e

message() {
  printf "%s! ✅ \n" "$1"
}

bluetooth() {
  sudo systemctl enable bluetooth.service

  message "'Bluetooth' Initialized"
}

jetbrains() {
  # Intellij Idea Ultimate
  echo 'export PATH="$HOME/.intellij-idea/bin:$PATH"' >>$HOME/.zshrc

  # Rust Rover
  echo 'export PATH="$HOME/.rust-rover/bin:$PATH"' >>$HOME/.zshrc

  message "'JetBrains IDE' Configured In Path"
}

desktop() {
  # Postman
  echo 'export PATH="$HOME/.postman-desktop/app:$PATH"' >>$HOME/.zshrc

  # Neo4j
  echo 'export PATH="$HOME/.neo4j-desktop:$PATH"' >>$HOME/.zshrc

  message "'Desktop App' Configured In Path"
}

reboot() {
  gnome-terminal -- bash -c "printf 'The system needs a reboot to activate the changes! 📚'; printf 'Preparing to reboot... \n'; sleep 2; sudo reboot now"
}

bluetooth && jetbrains && desktop && reboot
