#!/usr/bin/bash

set -e

PRETTIER_PLUGIN="svelte"

while getopts "a" OPTION; do
  case "$OPTION" in
  a)
    PRETTIER_PLUGIN="astro"
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

prettier_plugin() {
  # Prettier Formatter file
  PRETTIER_FORMAT=".prettierrc.yaml"

  # Prettier Plugin file
  PRETTIER_PLUGIN_FILE="prettier-svelte.txt"

  if test "$PRETTIER_PLUGIN" == "astro"; then
    PRETTIER_PLUGIN_FILE="prettier-astro.txt"
  fi

  curl -sSL "https://raw.githubusercontent.com/skn437/${LINUX}/master/.project/helpers/${PRETTIER_PLUGIN_FILE}" >>"./${PRETTIER_FORMAT}"

  message "Prettier Plugin Config File"
}

prettier_plugin
