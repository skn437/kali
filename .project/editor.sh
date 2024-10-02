#!/usr/bin/bash

set -e

LINUX="kali"

GET_RUSTFMT=false
GET_PRETTIER=false
GET_STYLELINT=false

PRETTIER_PLUGIN=""

while getopts "rp:s" OPTION; do
  case "${OPTION}" in
  r)
    GET_RUSTFMT=true
    ;;
  p)
    GET_PRETTIER=true
    PRETTIER_PLUGIN="$OPTARG"
    ;;
  s)
    GET_STYLELINT=true
    ;;
  ?)
    printf "Script Usage: %s \n" "bash (script) [-r] [-p plugin] [-s]"
    exit 1
    ;;
  esac
done

message() {
  printf "'%s' Added! ✅ \n" "$1"
}

editor_config() {
  # Editor Config file
  EDITOR_CONFIG=".editorconfig"

  curl -sSL "https://raw.githubusercontent.com/skn437/${LINUX}/master/${EDITOR_CONFIG}" >"./${EDITOR_CONFIG}"

  message "Editor Config File"
}

rustfmt() {
  # Rust Formatter file
  RUST_FORMAT="rustfmt.toml"
  RUST_ENV="rustenv.toml"

  curl -sSL "https://raw.githubusercontent.com/skn437/${LINUX}/master/${RUST_FORMAT}" >"./${RUST_FORMAT}"
  curl -sSL "https://raw.githubusercontent.com/skn437/${LINUX}/master/${RUST_ENV}" >"./${RUST_ENV}"

  message "Rustfmt Config File"
}

PRETTIER_FORMAT=".prettierrc.yaml"

prettier() {
  curl -sSL "https://raw.githubusercontent.com/skn437/${LINUX}/master/${PRETTIER_FORMAT}" >"./${PRETTIER_FORMAT}"

  message "Prettier Config File"
}

PRETTIER_PLUGIN_ARRAY=("svelte" "astro")

prettier_plugin() {
  PLUGIN_NAME="$1"

  # Prettier Plugin file
  PLUGIN_FILE="prettier-svelte.txt"

  if test "$PLUGIN_NAME" == "$PRETTIER_PLUGIN_ARRAY[1]"; then
    PLUGIN_FILE="prettier-astro.txt"
  fi

  curl -sSL "https://raw.githubusercontent.com/skn437/${LINUX}/master/.project/helpers/${PLUGIN_FILE}" >>"./${PRETTIER_FORMAT}"

  message "Prettier Plugin Config File"
}

stylelint() {
  # Stylelint Formatter file
  STYLELINT_FORMAT=".stylelintrc.yaml"

  curl -sSL "https://raw.githubusercontent.com/skn437/${LINUX}/master/${STYLELINT_FORMAT}" >"./${STYLELINT_FORMAT}"

  message "Stylelint Config File"
}

editor_config

if "${GET_RUSTFMT}"; then
  rustfmt
fi

if "${GET_PRETTIER}"; then
  prettier

  for element in "$PRETTIER_PLUGIN_ARRAY[@]"; do
    if test "$PRETTIER_PLUGIN" == "$element"; then
      prettier_plugin "$element"
      break
    fi
  done
fi

if "${GET_STYLELINT}"; then
  stylelint
fi
