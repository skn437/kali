#!/usr/bin/bash

set -e

LINUX="kali"

# Task file
TASKFILE="taskfile.yaml"
TASKFILE_ENV=".env.task"

curl -sSL "https://raw.githubusercontent.com/skn437/${LINUX}/master/${TASKFILE}" >"./${TASKFILE}"
curl -sSL "https://raw.githubusercontent.com/skn437/${LINUX}/master/${TASKFILE_ENV}" >"./${TASKFILE_ENV}"

# Lefthook file
LEFTHOOK="lefthook.yaml"

curl -sSL "https://raw.githubusercontent.com/skn437/${LINUX}/master/${LEFTHOOK}" >"./${LEFTHOOK}"
