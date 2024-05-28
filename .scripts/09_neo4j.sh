#!/usr/bin/bash

set -e

app_entry() {
  printf "'%s' Entry Configured! ✅ \n" "$1"
}

NEO4J_PATH="$HOME/.neo4j-desktop"

mkdir -p "${NEO4J_PATH}"

mv $HOME/Downloads/neo4j.AppImage "${NEO4J_PATH}/neo4j.AppImage"
chmod u+x "${NEO4J_PATH}/neo4j.AppImage"

NEO4J_DESKTOP_ENTRY="/usr/share/applications/neo4j.desktop"

sudo touch "${NEO4J_DESKTOP_ENTRY}"

APP_ENTRY_TEMPLATE="$(curl -sSL https://raw.githubusercontent.com/skn437/ubuntu/master/.scripts/helpers/neo4j_entry.txt)"

sudo echo "${APP_ENTRY_TEMPLATE}" >"${NEO4J_DESKTOP_ENTRY}"

echo 'export PATH="$HOME/.neo4j-desktop:$PATH"' >>$HOME/.bashrc

app_entry "Neo4j Desktop"
