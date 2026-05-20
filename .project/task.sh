#!/usr/bin/bash

set -e

LINUX="kali"

GET_LEFTHOOK=false

while getopts "l" OPTION; do
  case "$OPTION" in
  l)
    GET_LEFTHOOK=true
    ;;
  ?)
    printf "Script Usage: %s \n" "bash (script) [-l]"
    exit 1
    ;;
  esac
done

config_builder() {
  CONFIG_FILE="$1"

  curl -sSL "https://raw.githubusercontent.com/skn437/$LINUX/master/$CONFIG_FILE" >"./$CONFIG_FILE"

  printf "'%s' Added! ✅ \n" "$2"
}

config_builder "taskfile.yaml" "Task File"
config_builder ".env.task" "Task File Env File"

if "$GET_LEFTHOOK"; then
  config_builder "lefthook.yaml" "Lefthook File"
fi
