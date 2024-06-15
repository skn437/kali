#!/usr/bin/env bash

set -e

LINUX="kali"

GET_TASKFILE=false
GET_LEFTHOOK=false

while getopts "tl" OPTION; do
  case "${OPTION}" in
  t)
    GET_TASKFILE=true
    ;;
  l)
    GET_LEFTHOOK=true
    ;;
  ?)
    printf "Script Usage: %s \n" "bash (script) [-t] [-l]"
    exit 1
    ;;
  esac
done

taskfile() {
  # Task file
  TASKFILE="taskfile.yaml"
  TASKFILE_ENV=".env.task"

  curl -sSL "https://raw.githubusercontent.com/skn437/${LINUX}/master/${TASKFILE}" >"./${TASKFILE}"
  curl -sSL "https://raw.githubusercontent.com/skn437/${LINUX}/master/${TASKFILE_ENV}" >"./${TASKFILE_ENV}"
}

lefthook() {
  # Lefthook file
  LEFTHOOK="lefthook.yaml"

  curl -sSL "https://raw.githubusercontent.com/skn437/${LINUX}/master/${LEFTHOOK}" >"./${LEFTHOOK}"
}

if "${GET_TASKFILE}"; then
  taskfile
fi

if "${GET_LEFTHOOK}"; then
  lefthook
fi
