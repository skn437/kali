#!/usr/bin/bash

set -e

LINUX="kali"

main_shell() {
  MAIN_SHELL="main.sh"

  curl -sSL "https://raw.githubusercontent.com/skn437/${LINUX}/master/${MAIN_SHELL}" >"./${MAIN_SHELL}"

  printf "'Main Shell Config' Added! ✅ \n"
}

main_shell
