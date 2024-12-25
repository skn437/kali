#!/usr/bin/bash

set -e

LINUX="kali"

GET_RUSTFMT=false
GET_PRETTIER=false
GET_STYLELINT=false
GET_PHPSTAN=false

while getopts "rpsl" OPTION; do
  case "${OPTION}" in
  r)
    GET_RUSTFMT=true
    ;;
  p)
    GET_PRETTIER=true
    ;;
  s)
    GET_STYLELINT=true
    ;;
  l)
    GET_PHPSTAN=true
    ;;
  ?)
    printf "Script Usage: %s \n" "bash (script) [-r] [-p] [-s] [-l]"
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
  PRETTIER_FORMAT=".prettierrc.yaml"

  curl -sSL "https://raw.githubusercontent.com/skn437/${LINUX}/master/${PRETTIER_FORMAT}" >"./${PRETTIER_FORMAT}"

  message "Prettier Config File"
}

stylelint() {
  # Stylelint Formatter file
  STYLELINT_FORMAT=".stylelintrc.yaml"

  curl -sSL "https://raw.githubusercontent.com/skn437/${LINUX}/master/${STYLELINT_FORMAT}" >"./${STYLELINT_FORMAT}"

  message "Stylelint Config File"
}

phpstan() {
  # PHPStan Config file
  PHPSTAN_CONFIG="phpstan.neon"

  curl -sSL "https://raw.githubusercontent.com/skn437/${LINUX}/master/${PHPSTAN_CONFIG}" >"./${PHPSTAN_CONFIG}"

  message "PHPStan Config File"
}

editor_config

if "${GET_RUSTFMT}"; then
  rustfmt
fi

if "${GET_PRETTIER}"; then
  prettier
fi

if "${GET_STYLELINT}"; then
  stylelint
fi

if "${GET_PHPSTAN}"; then
  phpstan
fi
