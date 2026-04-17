#!/usr/bin/bash

set -e

usage_instruction_message() {
  printf "Script Usage: %s \n" "bash (script) [-p package-manager] [-i schedule-interval]"
}

DEPENDABOT=""
SCHEDULE=""

while getopts "p:i:" OPTION; do
  case "${OPTION}" in
  p)
    DEPENDABOT="${OPTARG}"
    ;;
  i)
    SCHEDULE="${OPTARG}"
    ;;
  ?)
    usage_instruction_message
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

  READ_CONFIG_INITIAL="$(cat ${DEPENDABOT_CONFIG_FILE} | sed s/package-manager/${DEPENDABOT}/)"
  READ_CONFIG="$(echo ${READ_CONFIG_INITIAL} | sed s/schedule-interval/${SCHEDULE}/)"

  GITHUB_DIRECTORY="./.github"
  mkdir -p "${GITHUB_DIRECTORY}"

  echo "${READ_CONFIG}" >"${GITHUB_DIRECTORY}/${DEPENDABOT_FILE}.yaml"

  rm "${DEPENDABOT_CONFIG_FILE}"

  printf "'Dependabot Config File' Added! ✅"
}

error_message() {
  printf "Specify a valid %s: " "$1"
  printf "'%s' " "$2"
  printf "\n"
}

PACKAGE_ARRAY=("npm" "gradle" "maven" "docker" "cargo" "nuget" "gomod" "pip" "composer")

SCHEDULE_INTERVAL_ARRAY=("daily" "weekly" "monthly" "quarterly" "semiannually" "yearly")

if test "${DEPENDABOT}" == ""; then
  error_message "package manager" "${PACKAGE_ARRAY[@]}"
  exit 1
fi

if test "${SCHEDULE}" == ""; then
  error_message "schedule interval" "${SCHEDULE_INTERVAL_ARRAY[@]}"
  exit 1
fi

for element in "${PACKAGE_ARRAY[@]}"; do
  if test "${DEPENDABOT}" == "${element}"; then
    for item in "${SCHEDULE_INTERVAL_ARRAY[@]}"; do
      if test "${SCHEDULE}" == "${item}"; then
        dependabot_config
        exit
      fi
    done
  fi
done

error_message "package manager" "${PACKAGE_ARRAY[@]}"
error_message "schedule interval" "${SCHEDULE_INTERVAL_ARRAY[@]}"
exit 1
