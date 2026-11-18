# FitBook reminder testing on Samsung (Dart + WorkManager)

FitBook uses **one shared Dart reminder implementation** on Android, iOS,
Linux, macOS and Windows. Android uses `workmanager` only to execute the Dart
callback in the background; no Kotlin meal reminder or AlarmManager receiver
is used. Web currently does not support notifications.

## What is checked

- `flutter test test/reminder_schedule_test.dart`: calendar-day boundaries,
  skipped meals, once-per-day notifications, and broad reminder windows
- On Samsung, `dumpsys jobscheduler`: a real persistent Android WorkManager
  job is registered for FitBook
- `cmd jobscheduler run -f -n androidx.work.systemjobscheduler`: optionally
  ask Android to run a due job without changing app data or the clock
- `logcat`: distinguish a completed Dart check from WorkManager refusing an
  early run. A forced JobScheduler run cannot bypass WorkManager's interval.

The test runs with **the release APK**. It does not install a temporary debug
version, export a test receiver or fabricate notification results. Run after
installing an updated signed FitBook:

```bash
python3 scripts/samsung_reminder_smoke.py --device 10.66.66.3:5555
```

To verify the signing key, upgrade the release APK in place, then smoke test:

```bash
python3 scripts/samsung_reminder_qa_cycle.py \
    --device 10.66.66.3:5555 \
    --release-apk /path/to/app-release.apk
```

Android's WorkManager is **inexact**. A successful forced job proves Dart
background execution and the diary-check path, but not that every future job
will execute before 9 pm. The 30-minute polling interval and 7:30–9 pm window
increase the opportunities. A 9 pm deadline is still best-effort, not guaranteed.

All supported platforms use the same `reminder_schedule.dart` decision logic.
`SharedPreferencesAsync` records the last notification per meal and day so
repeated workers don't spam duplicate notifications. Existing data is never
modified by the test script.

To request a run of an already-due job, use
`python3 scripts/samsung_reminder_smoke.py --force-run`. If early, the script
reports `DEFERRED` rather than incorrectly claiming that Dart failed. A
scheduled job is not itself proof of a delivered notification.
