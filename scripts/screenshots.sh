#!/bin/bash

set -ex

device_type="${1:-phoneScreenshots}"

if [[ "$(uname -s)" == Darwin* ]]; then
  echo "Screenshots not automated yet on MacOS..."
  exit 1
elif [[ "$(uname -s)" == Linux* ]] && grep -i -q Microsoft /proc/version 2>/dev/null; then
  echo "Launching $device_type on WSL..."
  
  emulator.exe -avd "$device_type" -no-boot-anim -noaudio -no-window &> /dev/null &
  while true; do
    for device in $(adb devices | awk 'NR>1{print $1}' | grep emulator); do
      name=$(
        adb -s $device emu avd name 2>/dev/null | head -n 1 | tr -d '\r'
      )
      [ "$name" = "$device_type" ] && break
    done

    boot_completed=$(
      adb -s "$device" shell getprop sys.boot_completed 2>/dev/null |
        tr -d '\r'
    )
    adb -s "$device" get-state 2>/dev/null | grep -q device &&
      [ "$name" = "$device_type" ] && [ "$boot_completed" = "1" ] &&
      break

    sleep 1
  done
elif [[ "$(uname -s)" == Linux* ]]; then
  echo "Launching $device_type on linux..."
  $TERMINAL -t Hide emulator -avd "$device_type" -feature -Vulkan \
    -no-boot-anim -noaudio -no-window &>/dev/null &

  while true; do
    for device in $(adb devices | awk 'NR>1{print $1}' | grep emulator); do
      name=$(
        adb -s $device emu avd name 2>/dev/null | head -n 1 | tr -d '\r'
      )
      [ "$name" = "$device_type" ] && break
    done

    boot_completed=$(
      adb -s "$device" shell getprop sys.boot_completed 2>/dev/null |
        tr -d '\r'
    )
    adb -s "$device" get-state 2>/dev/null | grep -q device &&
      [ "$name" = "$device_type" ] && [ "$boot_completed" = "1" ] &&
      break

    sleep 1
  done
else
  echo "Screenshots not supported on your platform."
  exit 1
fi

export FITBOOK_DEVICE_TYPE="$device_type"

./flutter/bin/flutter drive --profile --driver=test_driver/integration_test.dart \
  --target=integration_test/screenshot_test.dart \
  --dart-define=FITBOOK_DEVICE_TYPE="$device_type" -d "${device:-$device_type}"
code=$?

if [[ "$(uname -s)" == Darwin* ]]; then
  echo "Screenshots not automated yet on MacOS..."
  exit 1
elif [[ "$(uname -s)" == Linux* ]]; then
  adb -s "$device" reboot -p
  exit $code
else
  echo "Screenshots not supported on your platform."  
  exit 1
fi