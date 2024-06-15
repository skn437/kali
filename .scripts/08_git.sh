#!/usr/bin/bash

set -e

NAME=""
EMAIL=""

while getopts "n:e:" OPTION; do
  case "${OPTION}" in
  n)
    NAME=$OPTARG
    ;;
  e)
    EMAIL=$OPTARG
    ;;
  ?)
    printf "Script Usage: %s \n" "bash (script) [-n user-name] [-e user-email]"
    exit 1
    ;;
  esac
done

git_config() {
  git config --global user.name "${NAME}"
  git config --global user.email "${EMAIL}"
  git config --global init.defaultBranch master
  git config --global core.autocrlf false
  git config --global core.eol lf
  git config --global pull.rebase true

  printf "'Git Config' Prepared! ✅ \n"
}

git_config
