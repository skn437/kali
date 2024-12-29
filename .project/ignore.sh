#!/usr/bin/bash

set -e

GET_DOCKER_IGNORE=false
GET_PRETTIER_IGNORE=false
GET_ESLINT_IGNORE=false
GET_STYLELINT_IGNORE=false

while getopts "dpes" OPTION; do
  case "${OPTION}" in
  d)
    GET_DOCKER_IGNORE=true
    ;;
  p)
    GET_PRETTIER_IGNORE=true
    ;;
  e)
    GET_ESLINT_IGNORE=true
    ;;
  s)
    GET_STYLELINT_IGNORE=true
    ;;
  ?)
    printf "Script Usage: %s \n" "bash (script) [-d] [-p] [-e] [-s]"
    exit 1
    ;;
  esac
done

LINUX="kali"

IGNORE_FILES_ARRAY=(".gitignore" ".dockerignore" ".prettierignore" ".eslintignore" ".stylelintignore")

TEMPORARY_PATH="$HOME/.shell-lib"

mkdir -p "${TEMPORARY_PATH}"

TEMPORARY_GIT_IGNORE_TEXT="${TEMPORARY_PATH}/${IGNORE_FILES_ARRAY[0]}.txt"

curl -sSL "https://raw.githubusercontent.com/skn437/${LINUX}/master/${IGNORE_FILES_ARRAY[0]}" >"${TEMPORARY_GIT_IGNORE_TEXT}"

READ_GIT_IGNORE="$(cat "${TEMPORARY_GIT_IGNORE_TEXT}")"

TRIMMED_GIT_IGNORE="$(sed "1d" "${TEMPORARY_GIT_IGNORE_TEXT}")"

curl -sSL "https://raw.githubusercontent.com/skn437/${LINUX}/master/.project/helpers/${IGNORE_FILES_ARRAY[0]}" >"${TEMPORARY_GIT_IGNORE_TEXT}"

READ_DOCKER_IGNORE="$(curl -sSL "https://raw.githubusercontent.com/skn437/${LINUX}/master/.project/helpers/${IGNORE_FILES_ARRAY[1]}")"

read_ignore_info_line() {
  sed -n "$1" "${TEMPORARY_GIT_IGNORE_TEXT}" >"$2"
}

update_ignore() {
  read_ignore_info_line "$1" "$2"
  echo "${TRIMMED_GIT_IGNORE}" >>"$2"
}

message() {
  printf "'%s' Added! ✅ \n" "$1"
}

git_ignore() {
  # Git Ignore
  echo "${READ_GIT_IGNORE}" >"./${IGNORE_FILES_ARRAY[0]}"

  message "Git Ignore File"
}

docker_ignore() {
  # Docker Ignore
  DOCKER_IGNORE_PATH="./${IGNORE_FILES_ARRAY[1]}"

  update_ignore "1p" "${DOCKER_IGNORE_PATH}"
  printf "\n" >>"${DOCKER_IGNORE_PATH}"
  echo "${READ_DOCKER_IGNORE}" >>"${DOCKER_IGNORE_PATH}"

  message "Docker Ignore File"
}

prettier_ignore() {
  # Prettier Ignore
  update_ignore "2p" "./${IGNORE_FILES_ARRAY[2]}"

  message "Prettier Ignore File"
}

eslint_ignore() {
  # ESLint Ignore
  update_ignore "3p" "./${IGNORE_FILES_ARRAY[3]}"

  message "ESLint Ignore File"
}

stylelint_ignore() {
  # StyleLint Ignore
  update_ignore "4p" "./${IGNORE_FILES_ARRAY[4]}"

  message "StyleLint Ignore File"
}

git_ignore

if "${GET_DOCKER_IGNORE}"; then
  docker_ignore
fi

if "${GET_PRETTIER_IGNORE}"; then
  prettier_ignore
fi

if "${GET_ESLINT_IGNORE}"; then
  eslint_ignore
fi

if "${GET_STYLELINT_IGNORE}"; then
  stylelint_ignore
fi

rm "${TEMPORARY_GIT_IGNORE_TEXT}"
