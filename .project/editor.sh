#!/usr/bin/bash

set -e

LINUX="kali"

# Editor Config file
EDITOR_CONFIG=".editorconfig"

curl -sSL "https://raw.githubusercontent.com/skn437/${LINUX}/master/${EDITOR_CONFIG}" >"./${EDITOR_CONFIG}"

# Rust Formatter file
RUST_FORMAT="rustfmt.toml"
RUST_ENV="rustenv.toml"

if test -f "./Cargo.toml"; then
  curl -sSL "https://raw.githubusercontent.com/skn437/${LINUX}/master/${RUST_FORMAT}" >"./${RUST_FORMAT}"
  curl -sSL "https://raw.githubusercontent.com/skn437/${LINUX}/master/${RUST_ENV}" >"./${RUST_ENV}"
fi

# Prettier Formatter file
PRETTIER_FORMAT=".prettierrc.json"

if test -f "./package.json"; then
  curl -sSL "https://raw.githubusercontent.com/skn437/${LINUX}/master/${PRETTIER_FORMAT}" >"./${PRETTIER_FORMAT}"
fi

printf "'Editor Config File(s)' Installed! ✅ \n"
