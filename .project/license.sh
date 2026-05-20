#!/usr/bin/bash

set -e

LINUX="kali"

GET_APACHE=false

while getopts "a" OPTION; do
  case "$OPTION" in
  a)
    GET_APACHE=true
    ;;
  ?)
    printf "Script Usage: %s \n" "bash (script) [-a]"
    exit 1
    ;;
  esac
done

license_builder() {
  LICENSE_FILE="$1"

  curl -sSL "https://raw.githubusercontent.com/skn437/$LINUX/master/.project/helpers/$LICENSE_FILE" >"./LICENSE"

  printf "'%s' Added! ✅ \n" "$2"
}

if "$GET_APACHE"; then
  license_builder "LICENSE-APACHE" "Apache 2.0 License File"
else
  license_builder "LICENSE-MIT" "MIT License File"
fi
