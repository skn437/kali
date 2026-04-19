#!/usr/bin/bash

set -e

LINUX="kali"

npmrc() {
  NPM_CONFIG=".npmrc"

  if test -f "package.json"; then
    curl -sSL "https://raw.githubusercontent.com/skn437/${LINUX}/master/${NPM_CONFIG}" >"./${NPM_CONFIG}"
    printf "'NPM RC' Added! ✅ \n"
  else
    printf "'package.json' File Absent! ❌ \n"
    exit 1
  fi
}

npmrc
