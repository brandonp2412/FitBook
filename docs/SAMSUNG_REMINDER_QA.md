# Samsung Android meal-reminder smoke test

The **debug** APK contains `MealReminderTestReceiver`, which lets ADB test
notification posting, suppression when dinner is logged, and a genuine
`AlarmManager.setAndAllowWhileIdle` broadcast. The **release** APK never exports
that receiver. The test uses a separate notification ID (`9103`) and alarm
request ID; it never inserts, updates or deletes diary records and does not
replace the production 8 pm dinner alarm.

On Glass, use the paired Samsung over WireGuard at `10.66.66.3:5555`. Both APKs
must be signed with the **same original FitBook key** as the installed app,
not the usual Android debug key. Never commit `android/key.properties` or the
keystore. Build the debug and release APKs from the same commit, with a version
code at least as high as the installed version. The local Gradle root supplies
the CameraX AndroidX `concurrent-futures` dependency needed for release builds.

The end-to-end cycle is:

```bash
python3 scripts/samsung_reminder_qa_cycle.py \
  --device 10.66.66.3:5555 \
  --debug-apk /path/to/signed-debug.apk \
  --release-apk /path/to/signed-release.apk
```

The wrapper checks package IDs, APK signatures (including the one currently
installed), version codes, and debug-only manifest contents **before** any
installation. It updates in place with `adb install -r` (never uninstalls),
runs `samsung_reminder_smoke.py`, and restores the release APK in `finally`,
even if the smoke test fails. If restoration fails, address that before
using the debug APK as a daily driver.

Tests include:

1. Three pending production `RTC_WAKEUP` alarms exist, including dinner at 8 pm.
2. A simulated logged dinner suppresses the test notification.
3. A simulated unlogged dinner posts `[TEST] Don't forget to log dinner`.
4. A separate delayed Android alarm actually delivers the test notification.
5. The live meal alarms survive testing and the release is restored.

The smoke runner saves a notification-shade screenshot under
`/tmp/fitbook-samsung-reminder-evidence/` and removes its test notification
unless `--leave-test-notification` is specified. A sleeping/locked Samsung
may require its screen to be unlocked for readable screenshot capture; the
independent Android notification and alarm dumps remain authoritative.

To execute only the on-device assertions while a signed debug build is
installed:

```bash
python3 scripts/samsung_reminder_smoke.py --device 10.66.66.3:5555
```

If a host Flutter release build fails because the **generated** Java plugin
registrar references `IntegrationTestPlugin`, remove only that dev-only
`try/catch` registration block from the ignored
`android/app/src/main/java/io/flutter/plugins/GeneratedPluginRegistrant.java`
and rerun `cd android && ./gradlew :app:assembleRelease`. Do not change the
Flutter integration-test dependency or commit generated Java source.
