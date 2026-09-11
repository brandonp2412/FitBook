#!/usr/bin/env bash
set -uo pipefail

run_patrol_group() {
  local group=$1
  local patrol_args=(-t patrol_test/device_features_test.dart --tags="$group")

  if [ -n "${EMULATOR_PORT:-}" ]; then
    patrol_args+=(-d "emulator-$EMULATOR_PORT")
  fi

  for attempt in 1 2; do
    echo "Patrol $group attempt $attempt of 2"
    adb shell pm clear com.presley.fit_book || true
    adb wait-for-device

    timeout --signal=TERM --kill-after=30s 15m patrol test "${patrol_args[@]}"
    local status=$?
    if [ "$status" -eq 0 ]; then
      return 0
    fi
    if [ "$status" -ne 124 ]; then
      return "$status"
    fi
    if [ "$attempt" -lt 2 ]; then
      echo "Patrol $group timed out; retrying once from a clean app state"
    fi
  done

  return 124
}

run_patrol_group reminders
