#!/usr/bin/bash

set -e

SHELL_LIBRARY_FILE="$HOME/.shell-lib/ssu/main.sh"

if ! test -f "${SHELL_LIBRARY_FILE}"; then
  curl -sSL https://raw.githubusercontent.com/skn437/skn-shell-utils/master/build.sh | bash
fi

# shellcheck disable=SC1090
source "${SHELL_LIBRARY_FILE}"
