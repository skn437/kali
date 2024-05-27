#!/usr/bin/bash

set -e

apt_prepare() {
  sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y
}

echo 'export PROMPT_COMMAND="printf '\n';$PROMPT_COMMAND"' >>$HOME/.bashrc

apt_prepare && sudo apt install -y curl build-essential git gnome-tweaks
