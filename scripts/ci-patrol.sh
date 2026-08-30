#!/usr/bin/env bash
set -uo pipefail

last_status=1
for attempt in 1 2; do
  echo "Patrol attempt $attempt of 2"
  timeout --signal=TERM --kill-after=30s 18m patrol test -t patrol_test/device_features_test.dart
  last_status=$?
  if [ "$last_status" -eq 0 ]; then
    exit 0
  fi

  if [ "$attempt" -lt 2 ]; then
    echo "Patrol attempt $attempt failed or hung (exit $last_status); retrying from a clean app state"
    adb shell pm clear com.presley.fit_book || true
    adb wait-for-device
    ./android/gradlew --stop || true
  fi
done

exit "$last_status"
