#!/usr/bin/bash

set -e

icon_install() {
  printf "'%s' Installed! ✅ \n" "$1"
}

ICON_DIRECTORY="$HOME/.intellij-idea"

if test -d "${ICON_DIRECTORY}"; then
  rm -rf "${ICON_DIRECTORY}"
fi

mkdir -p "${ICON_DIRECTORY}"

curl -sSL https://raw.githubusercontent.com/skn437/ubuntu/master/.idea/icon.tar.gz | tar -xz -C "${ICON_DIRECTORY}"

icon_install "Icons"
