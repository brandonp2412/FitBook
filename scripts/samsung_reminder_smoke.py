#!/usr/bin/env python3
"""Non-destructive on-device smoke test for FitBook's Android dinner alarms.

Requires a signed, debuggable FitBook APK on the Samsung. The test receiver is
compiled into debug builds only. No meal entries or app settings are modified.

Usage: python3 scripts/samsung_reminder_smoke.py --device 10.66.66.3:5555
"""

import argparse
import re
import subprocess
import time
from pathlib import Path

PACKAGE = "com.presley.fit_book"
TEST_RECEIVER = f"{PACKAGE}/.MealReminderTestReceiver"


def adb(device, *args, timeout=20):
    result = subprocess.run(
        ["adb", "-s", device, *args], capture_output=True, text=True,
        timeout=timeout, check=False,
    )
    if result.returncode:
        raise RuntimeError(f"adb {args} failed: {result.stderr[-400:]}")
    return result.stdout


def broadcast(device, mode, seconds=None):
    args = ["shell", "am", "broadcast", "-f", "0x20", "-n", TEST_RECEIVER,
            "--es", "mode", mode]
    if seconds is not None:
        args += ["--ei", "seconds", str(seconds)]
    output = adb(device, *args)
    if "Broadcast completed" not in output:
        raise AssertionError(f"Android did not dispatch QA broadcast: {output}")


def notificationVisible(device):
    data = adb(device, "shell", "dumpsys", "notification", "--noredact", timeout=30)
    return bool(re.search(
        r"NotificationRecord\([^\n]*pkg=com\.presley\.fit_book(?:\s|\|)[^\n]*id=9103\b", data
    ))


def alarmDump(device):
    return adb(device, "shell", "dumpsys", "alarm", timeout=30)


def assertRealAlarm(device):
    data = alarmDump(device)
    # Match *pending* RTC_WAKEUP alarms, not historical events from a past run.
    pending = re.findall(
        r"RTC_WAKEUP #\d+: Alarm\{[^\n]+com\.presley\.fit_book\}\s+"
        r"tag=\*walarm\*:com\.presley\.fit_book/\.MealReminderReceiver",
        data,
    )
    if len(pending) < 3:
        raise AssertionError(f"Expected three pending meal alarms, found {len(pending)}")
    print("PASS: three regular RTC_WAKEUP meal alarms remain scheduled", flush=True)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--device", default="10.66.66.3:5555")
    parser.add_argument("--delay", type=int, default=20)
    parser.add_argument("--timeout", type=int, default=150)
    parser.add_argument("--leave-test-notification", action="store_true")
    args = parser.parse_args()

    state = adb(args.device, "get-state").strip()
    if state != "device":
        raise AssertionError(f"ADB unavailable: {state}")
    # Explicit receivers without intent-filters are not listed by Samsung's
    # `dumpsys package` resolver table, so verify by dispatching a real intent.
    broadcast(args.device, "cancel")
    print("PASS: Samsung reachable and debug-only test receiver responds", flush=True)
    assertRealAlarm(args.device)

    if notificationVisible(args.device):
        raise AssertionError("Could not clear previous QA notification")
    broadcast(args.device, "logged")
    time.sleep(2)
    if notificationVisible(args.device):
        raise AssertionError("Logged dinner incorrectly displayed a notification")
    print("PASS: logged dinner suppresses reminder", flush=True)

    broadcast(args.device, "unlogged")
    time.sleep(2)
    if not notificationVisible(args.device):
        raise AssertionError("Unlogged dinner did not display a reminder")
    print("PASS: unlogged dinner posts a visible notification", flush=True)

    broadcast(args.device, "cancel")
    broadcast(args.device, "schedule", seconds=args.delay)
    if "MealReminderTestReceiver" not in alarmDump(args.device):
        raise AssertionError("Android did not register the QA AlarmManager alarm")
    print("PASS: AlarmManager accepted scheduled QA alarm", flush=True)

    start = time.monotonic()
    while time.monotonic() - start < args.timeout:
        if notificationVisible(args.device):
            print(f"PASS: Android alarm fired and posted reminder ({round(time.monotonic()-start)}s)", flush=True)
            break
        time.sleep(3)
    else:
        raise AssertionError("Scheduled QA reminder not delivered before timeout")

    assertRealAlarm(args.device)
    log = adb(args.device, "logcat", "-d", "-s", "FitBookReminders:I", "*:S", timeout=30)
    for marker in ["QA suppressed", "QA posted", "QA alarm scheduled"]:
        if marker not in log:
            raise AssertionError(f"Expected diagnostic log missing: {marker}")
    print("PASS: on-device logs confirm suppression, posting, and alarm", flush=True)
    # A Samsung always-on display screenshots as nearly black, even when
    # notifications exist. Wake and dismiss keyguard before opening the shade.
    adb(args.device, "shell", "input", "keyevent", "KEYCODE_WAKEUP")
    adb(args.device, "shell", "wm", "dismiss-keyguard")
    adb(args.device, "shell", "input", "swipe", "500", "30", "500", "1700", "500")
    time.sleep(1)
    evidenceDir = Path("/tmp/fitbook-samsung-reminder-evidence")
    evidenceDir.mkdir(parents=True, exist_ok=True)
    imageFile = evidenceDir / "notification-shade.png"
    screenshot = subprocess.run(
        ["adb", "-s", args.device, "exec-out", "screencap", "-p"],
        capture_output=True, timeout=25, check=True,
    )
    imageFile.write_bytes(screenshot.stdout)
    print(f"SCREENSHOT: {imageFile}", flush=True)
    if not args.leave_test_notification:
        broadcast(args.device, "cancel")
        print("PASS: QA notification and alarm cleaned up", flush=True)
    print("PASS: Samsung dinner reminder smoke suite", flush=True)


if __name__ == "__main__":
    main()
