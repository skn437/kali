#!/usr/bin/bash

set -e

LINUX="kali"

GET_APACHE=false

while getopts "a" OPTION; do
  case "${OPTION}" in
  a)
    GET_APACHE=true
    ;;
  ?)
    printf "Script Usage: %s \n" "bash (script) [-a]"
    exit 1
    ;;
  esac
done

message() {
  printf "'%s' Added! ✅ \n" "$1"
}

mit() {
  # MIT License
  curl -sSL "https://raw.githubusercontent.com/skn437/${LINUX}/master/.project/helpers/LICENSE-MIT" >"./LICENSE"

  message "MIT License File"
}

apache() {
  # Apache 2.0 License
  curl -sSL "https://raw.githubusercontent.com/skn437/${LINUX}/master/.project/helpers/LICENSE-APACHE" >"./LICENSE"

  message "Apache 2.0 License File"
}

if "${GET_APACHE}"; then
  apache
else
  mit
fi
