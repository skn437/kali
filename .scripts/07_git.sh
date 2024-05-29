#!/usr/bin/bash

set -e

git config --global user.name "skn437"
git config --global user.email "skn437physx@gmail.com"
git config --global init.defaultBranch master
git config --global core.autocrlf false
git config --global core.eol lf
git config --global pull.rebase true

printf "'Git Config' Prepared! ✅ \n"
