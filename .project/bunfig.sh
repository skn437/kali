#!/usr/bin/bash

set -e

LINUX="kali"

bunfig() {
  BUN_CONFIG="bunfig.toml"

  if test -f "./package.json"; then
    curl -sSL "https://raw.githubusercontent.com/skn437/${LINUX}/master/${BUN_CONFIG}" >"./${BUN_CONFIG}"

    printf "'Bun Config' Added! ✅ \n"
  else
    printf "'package.json' File Absent! ❌ \n"
    exit 1
  fi
}

bunfig
