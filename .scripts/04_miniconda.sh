#!/usr/bin/bash

set -e

package_install() {
  printf "'%s' Installed! ✅ \n" "$1"
}

miniconda() {
  mkdir -p $HOME/miniconda3
  wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O $HOME/miniconda3/miniconda.sh
  bash $HOME/miniconda3/miniconda.sh -b -u -p $HOME/miniconda3
  rm -rf $HOME/miniconda3/miniconda.sh
}

miniconda_init() {
  $HOME/miniconda3/bin/conda init bash
}

miniconda

printf "\n"

miniconda_init

package_install "Miniconda"
