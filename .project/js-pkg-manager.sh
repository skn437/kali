#!/usr/bin/bash

set -e

usage_instruction_message() {
  printf "Script Usage: %s \n" "bash (script) [-p / -b]"
}

PNPM_FLAG=0
BUN_FLAG=0

while getopts "pb" OPTION; do
  case "$OPTION" in
  p)
    PNPM_FLAG=1
    ;;
  b)
    BUN_FLAG=1
    ;;
  ?)
    usage_instruction_message
    exit 1
    ;;
  esac
done

LINUX="kali"

config_builder() {
  CONFIG_FILE="$1"

  if [[ -f "package.json" ]]; then
    curl -sSL "https://raw.githubusercontent.com/skn437/$LINUX/master/$CONFIG_FILE" >"./$CONFIG_FILE"
    printf "'%s' Added! ✅ \n" "$2"
  else
    printf "'package.json' File Absent! ❌ \n"
    exit 1
  fi
}

if [[ $(("PNPM_FLAG + BUN_FLAG")) -gt 1 ]]; then
  usage_instruction_message
  exit 1
elif [[ "$PNPM_FLAG" -eq 1 ]]; then
  config_builder "pnpm-workspace.yaml" "PNPM Workspace Config"
elif [[ "$BUN_FLAG" -eq 1 ]]; then
  config_builder "bunfig.toml" "Bun Config"
else
  config_builder ".npmrc" "NPM RC"
fi
