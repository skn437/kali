#!/usr/bin/bash

set -e

DEPENDABOT=""

while getopts "p:" OPTION; do
  case "${OPTION}" in
  p)
    DEPENDABOT="${OPTARG}"
    ;;
  ?)
    printf "Script Usage: %s \n" "bash (script) [-p package-manager]"
    exit 1
    ;;
  esac
done

LINUX="kali"

dependabot_config() {
  TEMPORARY_PATH="$HOME/.shell-lib"
  DEPENDABOT_FILE="dependabot"

  mkdir -p "${TEMPORARY_PATH}"

  DEPENDABOT_CONFIG_FILE="${TEMPORARY_PATH}/${DEPENDABOT_FILE}.txt"

  curl -sSL "https://raw.githubusercontent.com/skn437/${LINUX}/master/.project/helpers/${DEPENDABOT_FILE}.txt" >"${DEPENDABOT_CONFIG_FILE}"

  READ_CONFIG="$(cat ${DEPENDABOT_CONFIG_FILE} | sed s/package-manager/${DEPENDABOT}/)"

  GITHUB_DIRECTORY="./.github"
  mkdir -p "${GITHUB_DIRECTORY}"

  echo "${READ_CONFIG}" >"${GITHUB_DIRECTORY}/${DEPENDABOT_FILE}.yaml"

  rm "${DEPENDABOT_CONFIG_FILE}"

  printf "'Dependabot Config File' Added! ✅"
}

PACKAGE_ARRAY=("npm" "gradle" "docker" "cargo" "nuget")

package_error_message() {
  printf "Specify a valid package manager: "
  printf "'%s' " "${PACKAGE_ARRAY[@]}"
  printf "\n"
  exit 1
}

if test "${DEPENDABOT}" == ""; then
  package_error_message
fi

for element in "${PACKAGE_ARRAY[@]}"; do
  if test "${DEPENDABOT}" == "${element}"; then
    dependabot_config
    exit
  fi
done

package_error_message
