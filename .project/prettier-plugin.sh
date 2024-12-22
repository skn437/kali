#!/usr/bin/bash

set -e

PRETTIER_PLUGIN=""

while getopts "p:" OPTION; do
  case "$OPTION" in
  p)
    PRETTIER_PLUGIN="$OPTARG"
    ;;
  ?)
    printf "Script Usage: %s \n" "bash (script) [-p plugin-name]"
    exit 1
    ;;
  esac
done

LINUX="kali"

message() {
  printf "'%s' Added! ✅ \n" "$1"
}

# Prettier Plugin array
PRETTIER_PLUGIN_ARRAY=("svelte" "astro" "java" "tool" "php")

plugin_error_message() {
  printf "Specify a valid prettier plugin: "
  printf "'%s' " "${PRETTIER_PLUGIN_ARRAY[@]}"
  printf "\n"
  exit 1
}

prettier_plugin() {
  # Prettier Formatter file
  PRETTIER_FORMAT=".prettierrc.yaml"

  curl -sSL "https://raw.githubusercontent.com/skn437/${LINUX}/master/.project/helpers/prettier-${PRETTIER_PLUGIN}.txt" >>"./${PRETTIER_FORMAT}"

  message "Prettier Plugin Config File"
}

if test "$PRETTIER_PLUGIN" == ""; then
  plugin_error_message
fi

for element in "${PRETTIER_PLUGIN_ARRAY[@]}"; do
  if test "$PRETTIER_PLUGIN" == "$element"; then
    prettier_plugin
    exit
  fi
done
