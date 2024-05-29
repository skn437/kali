#!/usr/bin/bash

set -e

NEO4J_PATH="$HOME/.neo4j-desktop"

mkdir -p "${NEO4J_PATH}"

TEMPORARY_DESKTOP_ENTRY="${NEO4J_PATH}/neo4j.desktop"

APP_ENTRY_TEMPLATE="$(curl -sSL https://raw.githubusercontent.com/skn437/ubuntu/master/.scripts/helpers/neo4j_entry.txt)"

if test -f "${TEMPORARY_DESKTOP_ENTRY}"; then
  rm "${TEMPORARY_DESKTOP_ENTRY}"
fi

touch "${TEMPORARY_DESKTOP_ENTRY}"
echo "${APP_ENTRY_TEMPLATE}" >"${TEMPORARY_DESKTOP_ENTRY}"

mv $HOME/Downloads/neo4j.AppImage "${NEO4J_PATH}/neo4j.AppImage"
# chmod u+x "${NEO4J_PATH}/neo4j.AppImage"

NEO4J_DESKTOP_ENTRY="/usr/share/applications/neo4j.desktop"

if test -f "${NEO4J_DESKTOP_ENTRY}"; then
  sudo rm "${NEO4J_DESKTOP_ENTRY}"
fi

sudo mv "${TEMPORARY_DESKTOP_ENTRY}" "${NEO4J_DESKTOP_ENTRY}"

echo 'export PATH="$HOME/.neo4j-desktop:$PATH"' >>$HOME/.zshrc

printf "'Neo4j Desktop' Entry Configured! ✅ \n"
