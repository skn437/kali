#!/usr/bin/bash

set -e

app_entry() {
  printf "'%s' Entry Configured! ✅ \n" "$1"
}

MECHVIBES_DESKTOP_ENTRY="/usr/share/applications/mechvibes.desktop"

APP_ENTRY_TEMPLATE="$(curl -sSL https://raw.githubusercontent.com/skn437/ubuntu/master/.scripts/helpers/mechvibes_entry.txt)"

echo "${APP_ENTRY_TEMPLATE}" >"${MECHVIBES_DESKTOP_ENTRY}"

app_entry "Mechvibes"
