#!/usr/bin/bash

set -e

IGNORE_FILES_ARRAY=(".gitignore" ".dockerignore" ".prettierignore" ".eslintignore")

TEMPORARY_PATH="$HOME/.shell-lib"

mkdir -p "${TEMPORARY_PATH}"

TEMPORARY_GIT_IGNORE_TEXT="${TEMPORARY_PATH}/${IGNORE_FILES_ARRAY[0]}.txt"

curl -sSL "https://raw.githubusercontent.com/skn437/ubuntu/master/${IGNORE_FILES_ARRAY[0]}" >"${TEMPORARY_GIT_IGNORE_TEXT}"

READ_GIT_IGNORE="$(cat '${TEMPORARY_GIT_IGNORE_TEXT}')"

TRIMMED_GIT_IGNORE="$(sed "1d" "${TEMPORARY_GIT_IGNORE_TEXT}")"

curl -sSL "https://raw.githubusercontent.com/skn437/ubuntu/master/.project/helpers/${IGNORE_FILES_ARRAY[0]}" >"${TEMPORARY_GIT_IGNORE_TEXT}"

READ_DOCKER_IGNORE="$(curl -sSL "https://raw.githubusercontent.com/skn437/ubuntu/master/.project/helpers/${IGNORE_FILES_ARRAY[1]}")"

read_ignore_info_line() {
  sed -n "$1" "${TEMPORARY_GIT_IGNORE_TEXT}" >"$2"
}

update_ignore() {
  read_ignore_info_line "$1" "$2"
  echo "${TRIMMED_GIT_IGNORE}" >>"$2"
}

update_docker_ignore() {
  DOCKER_IGNORE_PATH="./${IGNORE_FILES_ARRAY[1]}"

  update_ignore "1p" "${DOCKER_IGNORE_PATH}"
  printf "\n" >>"${DOCKER_IGNORE_PATH}"
  echo "${READ_DOCKER_IGNORE}" >>"${DOCKER_IGNORE_PATH}"
}

echo "${READ_GIT_IGNORE}" >"./${IGNORE_FILES_ARRAY[0]}"
update_docker_ignore

if test -f "./package.json"; then
  update_ignore "2p" "./${IGNORE_FILES_ARRAY[2]}"
  update_ignore "3p" "./${IGNORE_FILES_ARRAY[3]}"
else
  printf "'${IGNORE_FILES_ARRAY[0]}' & '${IGNORE_FILES_ARRAY[1]}' files are not configured! \n"
fi

rm "${TEMPORARY_GIT_IGNORE_TEXT}"

printf "Ignore Files Configuration Finished! ✅ \n"
