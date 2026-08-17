#!/usr/bin/env bash
# The single source of truth for "is this app OK": verifies dependencies,
# regenerates code, formats, auto-fixes lints, then analyzes and tests. Used by
# both .githooks/pre-push and the release workflow, so there's exactly one place
# that defines what passing means.
set -euo pipefail

repo_root=$(git rev-parse --show-toplevel)
cd "$repo_root"

# F-Droid builds with --enforce-lockfile. Do the same here so an SDK/submodule
# change cannot silently rewrite pubspec.lock in CI and fail only downstream.
flutter/bin/flutter pub get --enforce-lockfile
flutter/bin/dart run build_runner build

echo "== formatting =="
flutter/bin/dart format lib test

echo "== applying auto-fixes =="
flutter/bin/dart fix --apply lib
flutter/bin/dart fix --apply test

echo "== analyzing =="
flutter/bin/flutter analyze lib test

echo "== testing =="
flutter/bin/flutter test
