#!/usr/bin/bash

set -e

LINUX="kali"

GET_RUSTFMT=false
GET_PRETTIER=false
GET_STYLELINT=false
GET_PHPSTAN=false
GET_ESLINT=false

while getopts "rpsle" OPTION; do
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
  e)
    GET_ESLINT=true
    ;;
  ?)
    printf "Script Usage: %s \n" "bash (script) [-r] [-p] [-s] [-l] [-e]"
    exit 1
    ;;
  esac
done

message() {
  printf "'%s' Added! ✅ \n" "$1"
}

config_builder() {
  CONFIG_FILE="$1"

  curl -sSL "https://raw.githubusercontent.com/skn437/$LINUX/master/$CONFIG_FILE" >"./$CONFIG_FILE"

  message "$2 Config File"
}

config_builder ".editorconfig" "Editor"

if "$GET_RUSTFMT"; then
  config_builder "rustfmt.toml" "Rustfmt"
  config_builder "rustenv.toml" "RustEnv"
fi

if "$GET_PRETTIER"; then
  config_builder ".prettierrc.yaml" "Prettier"
fi

if "$GET_STYLELINT"; then
  config_builder ".stylelintrc.yaml" "StyleLint"
fi

if "$GET_PHPSTAN"; then
  config_builder "phpstan.neon" "PHPStan"
fi

if "$GET_ESLINT"; then
  config_builder ".eslintrc.yaml" "ESLint"
fi
