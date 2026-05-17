#!/usr/bin/bash

set -e

LINUX="kali"

pnpm_workspace() {
  PNPM_CONFIG="pnpm-workspace.yaml"

  if test -f "package.json"; then
    curl -sSL "https://raw.githubusercontent.com/skn437/${LINUX}/master/${PNPM_CONFIG}" >"./${PNPM_CONFIG}"
    printf "'PNPM Workspace Config' Added! ✅ \n"
  else
    printf "'package.json' File Absent! ❌ \n"
    exit 1
  fi
}

pnpm_workspace
