#!/usr/bin/bash

set -e

LINUX="kali"

idea() {
  IDEA_DIRECTORY="./.idea"

  GIT_IGNORE=".gitignore"
  JSON_SCHEMA="jsonSchemas.xml"

  if test -d "${IDEA_DIRECTORY}"; then
    curl -sSL "https://raw.githubusercontent.com/skn437/${LINUX}/master/.project/helpers/${JSON_SCHEMA}" >"${IDEA_DIRECTORY}/${JSON_SCHEMA}"
    curl -sSL "https://raw.githubusercontent.com/skn437/${LINUX}/master/.project/helpers/idea-ignore.txt" >"${IDEA_DIRECTORY}/${GIT_IGNORE}"

    printf "'Intellij Idea Settings' Added! ✅ \n"
  else
    printf "'.idea' Directory Absent! ❌ \n"
    exit 1
  fi
}

idea
