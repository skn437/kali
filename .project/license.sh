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

mit() {
  curl -sSL "https://raw.githubusercontent.com/skn437/${LINUX}/master/.project/helpers/LICENSE-MIT" >"./LICENSE"
}

apache() {
  curl -sSL "https://raw.githubusercontent.com/skn437/${LINUX}/master/.project/helpers/LICENSE-APACHE" >"./LICENSE"
}

if "${GET_APACHE}"; then
  apache
else
  mit
fi
