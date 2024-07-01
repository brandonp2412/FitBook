#!/bin/sh

set -ex

device_type="$1"

case "$(uname -s)" in 
  Linux*)
    $TERMINAL -t Hide emulator -avd "$device_type" -feature -Vulkan -no-boot-anim -noaudio &> /dev/null &

    while true; do  
      for device in $(adb devices | awk 'NR>1{print $1}' | grep emulator); do
        name=$(adb -s $device emu avd name | head -n 1 | tr -d '\r') 
        [ "$name" = "$device_type" ] && break
      done

      boot_completed=$(adb -s "$device" shell getprop sys.boot_completed | tr -d '\r')
      adb -s "$device" get-state | grep -q device && [ "$name" = "$device_type" ] && [ "$boot_completed" = "1" ] \
        && break

      sleep 1
    done
  ;;
esac

export FLEXIFY_DEVICE_TYPE="$device_type"

flutter drive --driver=test_driver/integration_test.dart \
  --target=integration_test/screenshot_test.dart \
  --dart-define=FLEXIFY_DEVICE_TYPE="$device_type" -d "${device:-$device_type}"
code=$?

case "$(uname -s)" in 
  Linux*)
    adb -s "$device" reboot -p
    exit $code
  ;;
esac