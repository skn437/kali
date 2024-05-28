#!/usr/bin/bash

set -e

ICON_DIRECTORY="$HOME/.intellij-idea"

if test -d "${ICON_DIRECTORY}"; then
  rm -rf "${ICON_DIRECTORY}"
fi

mkdir -p "${ICON_DIRECTORY}"

curl -sSL https://raw.githubusercontent.com/skn437/ubuntu/master/.idea/icon.tar.gz | tar -xz -C "${ICON_DIRECTORY}"
