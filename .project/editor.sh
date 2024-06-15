#!/usr/bin/bash

set -e

LINUX="kali"

GET_RUSTFMT=false
GET_PRETTIER=false

while getopts "rp" OPTION; do
  case "${OPTION}" in
  r)
    GET_RUSTFMT=true
    ;;
  p)
    GET_PRETTIER=true
    ;;
  ?)
    printf "Script Usage: %s \n" "bash (script) [-r] [-p]"
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

prettier() {
  # Prettier Formatter file
  PRETTIER_FORMAT=".prettierrc.json"

  curl -sSL "https://raw.githubusercontent.com/skn437/${LINUX}/master/${PRETTIER_FORMAT}" >"./${PRETTIER_FORMAT}"

  message "Prettier Config File"
}

editor_config

if "${GET_RUSTFMT}"; then
  rustfmt
fi

if "${GET_PRETTIER}"; then
  prettier
fi
