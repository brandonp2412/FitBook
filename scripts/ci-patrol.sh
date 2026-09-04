#!/usr/bin/env bash
set -uo pipefail

run_patrol_group() {
  local group=$1
  local last_status=1
  local attempt
  local patrol_args=(-t patrol_test/device_features_test.dart --tags="$group")

  if [ -n "${EMULATOR_PORT:-}" ]; then
    patrol_args+=(-d "emulator-$EMULATOR_PORT")
  fi

  for attempt in 1 2; do
    echo "Patrol $group attempt $attempt of 2"
    adb shell pm clear com.google.android.documentsui || true
    adb shell pm clear com.android.documentsui || true
    adb shell pm clear com.presley.fit_book || true
    adb wait-for-device

    timeout --signal=TERM --kill-after=30s 18m patrol test "${patrol_args[@]}"
    last_status=$?
    if [ "$last_status" -eq 0 ]; then
      return 0
    fi

    if [ "$attempt" -lt 2 ]; then
      echo "Patrol $group attempt $attempt failed or hung (exit $last_status); retrying from a clean app state"
      ./android/gradlew --stop || true
    fi
  done

  return "$last_status"
}

run_patrol_group backup || exit $?
run_patrol_group reminders || exit $?
