#!/usr/bin/bash

set -e

LINUX="kali"

GET_LEFTHOOK=false

while getopts "tl" OPTION; do
  case "${OPTION}" in
  l)
    GET_LEFTHOOK=true
    ;;
  ?)
    printf "Script Usage: %s \n" "bash (script) [-l]"
    exit 1
    ;;
  esac
done

message() {
  printf "'%s' Added! ✅ \n" "$1"
}

taskfile() {
  # Task file
  TASKFILE="taskfile.yaml"
  TASKFILE_ENV=".env.task"

  curl -sSL "https://raw.githubusercontent.com/skn437/${LINUX}/master/${TASKFILE}" >"./${TASKFILE}"
  curl -sSL "https://raw.githubusercontent.com/skn437/${LINUX}/master/${TASKFILE_ENV}" >"./${TASKFILE_ENV}"

  message "Task File"
}

lefthook() {
  # Lefthook file
  LEFTHOOK="lefthook.yaml"

  curl -sSL "https://raw.githubusercontent.com/skn437/${LINUX}/master/${LEFTHOOK}" >"./${LEFTHOOK}"

  message "Lefthook File"
}

taskfile

if "${GET_LEFTHOOK}"; then
  lefthook
fi
