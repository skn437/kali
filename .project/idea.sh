#!/usr/bin/bash

set -e

LINUX="kali"

idea() {
  IDEA_DIRECTORY="./.idea"
  JSON_SCHEMA="jsonSchemas.xml"

  if test -d "${IDEA_DIRECTORY}"; then
    curl -sSL "https://raw.githubusercontent.com/skn437/${LINUX}/master/.project/helpers/${JSON_SCHEMA}" >"${IDEA_DIRECTORY}/${JSON_SCHEMA}"

    printf "'Intellij Idea JSON Schema' Added! ✅ \n"
  else
    printf "'.idea' Directory Absent! ❌ \n"
    exit 1
  fi
}

idea
