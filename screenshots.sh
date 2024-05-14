#!/bin/sh

if [ "$#" -eq 0 ]; then
    echo "Error: No arguments supplied"
    exit 1
fi

$TERMINAL -t Hide emulator -avd "$1" -feature -Vulkan -no-boot-anim -noaudio &> /dev/null &

while true; do  
for device in $(adb devices | awk 'NR>1{print $1}' | grep emulator); do
  name=$(adb -s $device emu avd name | head -n 1 | tr -d '\r') 
  [ "$name" = "$1" ] && break
done
boot_completed=$(adb -s "$device" shell getprop sys.boot_completed | tr -d '\r')
adb -s "$device" get-state | grep -q device && [ "$name" = "$1" ] && [ "$boot_completed" = "1" ] \
  && break
sleep 1
done

export FLEXIFY_DEVICE_TYPE="$1"

flutter drive --driver=test_driver/integration_test.dart \
  --target=integration_test/screenshot_test.dart \
  --dart-define=FLEXIFY_DEVICE_TYPE="$1" --profile -d "$device"
code=$?

adb -s "$device" reboot -p

exit $code