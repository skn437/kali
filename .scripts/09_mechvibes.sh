#!/usr/bin/bash

set -e

app_entry() {
  printf "'%s' Entry Configured! ✅ \n" "$1"
}

sudo cat "$(curl -sSL https://raw.githubusercontent.com/skn437/ubuntu/master/.scripts/helpers/mechvibes_entry.txt)" >"/usr/share/applications/mechvibes.desktop"

app_entry "Mechvibes"
