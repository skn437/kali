#!/usr/bin/bash

set -e

ICON_DIRECTORY="$HOME/.intellij-idea"

if test -d "${ICON_DIRECTORY}"; then
  rm -rf "${ICON_DIRECTORY}"
fi

curl -sSL "" | tar -xzf >"${ICON_DIRECTORY}"
