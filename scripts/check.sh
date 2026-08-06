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
flutter pub get --enforce-lockfile
dart run build_runner build -d

echo "== formatting =="
dart format lib test

echo "== applying auto-fixes =="
dart fix --apply lib
dart fix --apply test

echo "== analyzing =="
flutter analyze lib test

echo "== testing =="
flutter test
