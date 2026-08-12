# Device E2E tests

These Patrol tests exercise FitBook's Android integrations against the real
system UI: notification permission, the Storage Access Framework folder picker,
the production backup receiver, and the notification shade.

Run them on a clean Android emulator or physical device:

```sh
flutter pub global activate patrol_cli
patrol doctor
patrol test -t patrol_test/device_features_test.dart
```

Run only the reminder tests with:

```sh
patrol test -t patrol_test/device_features_test.dart --tags=reminders
```

The backup test creates a fresh folder in the current picker location. Use an
English Android system image because the native selectors use Android's English labels.

Run the test on a physical device with notification sound and vibration enabled
when those sensory outputs need manual verification. Their final behavior is
controlled by the Android notification channel and the user's device settings;
Patrol can verify the notification UI but cannot hear sound or sense vibration.
