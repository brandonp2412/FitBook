#!/bin/bash

set -ex

dart run build_runner build -d
dart run drift_dev make-migrations

if [ -n "$(git diff --stat '**schema**' '**migration**')" ]; then
  echo "There are unstaged changes in the repository:"
  git --no-pager diff
  exit 1
fi
