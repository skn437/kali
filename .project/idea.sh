#!/usr/bin/bash

set -e

LINUX="kali"

idea() {
  JSON_SCHEMA="jsonSchemas.xml"

  mkdir -p ./.idea

  curl -sSL "https://raw.githubusercontent.com/skn437/${LINUX}/master/.idea/${JSON_SCHEMA}" >"./.idea/${JSON_SCHEMA}"

  printf "'Intellij Idea JSON Schema' Added! ✅ \n"
}

idea
