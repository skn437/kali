#!/usr/bin/bash

set -e

IGNORE_FILES_ARRAY=(".gitignore" ".dockerignore" ".prettierignore" ".eslintignore")

printf "You will get '${IGNORE_FILES_ARRAY[0]}' & '${IGNORE_FILES_ARRAY[1]}' by default! \n"
printf "Do you want '${IGNORE_FILES_ARRAY[2]}' and '${IGNORE_FILES_ARRAY[3]}' as well?  \n"
printf "Press 'y' for to say yes & 'n' to say no! \n"
printf "Enter your choice: $(read -n 1 KEY)"

READ_GIT_IGNORE="$(curl -sSL "https://raw.githubusercontent.com/skn437/ubuntu/master/${IGNORE_FILES_ARRAY[0]}")"

TRIMMED_GIT_IGNORE="$(sed "1d" "${READ_GIT_IGNORE}")"

IGNORE_INFO="$(curl -sSL "https://raw.githubusercontent.com/skn437/ubuntu/master/.project/helpers/${IGNORE_FILES_ARRAY[0]}")"

READ_DOCKER_IGNORE="$(curl -sSL "https://raw.githubusercontent.com/skn437/ubuntu/master/.project/helpers/${IGNORE_FILES_ARRAY[1]}")"

read_ignore_info_line() {
  sed -n "$1" "${IGNORE_INFO}" >"$2"
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

printf "\nProcessing... \n"

echo "${READ_GIT_IGNORE}" >"./${IGNORE_FILES_ARRAY[0]}"
update_docker_ignore

if test "${KEY}" == "y"; then
  update_ignore "2p" "./${IGNORE_FILES_ARRAY[2]}"
  update_ignore "3p" "./${IGNORE_FILES_ARRAY[3]}"
else
  printf "'${IGNORE_FILES_ARRAY[0]}' & '${IGNORE_FILES_ARRAY[1]}' files are not configured! \n"
fi

printf "Ignore Files Configuration Finished! ✅ \n"
