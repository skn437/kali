#!/usr/bin/bash

set -e

apt_prepare() {
  sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y
}

nvidia() {
  # Nvidia Driver & Toolkit
  sudo apt install -y nvidia-driver nvidia-cuda-toolkit
  printf "'Nvidia Driver & Toolkit' Installed! ✅ \n"
}

apt_prepare && nvidia
