# FitBook localization roadmap

## Foundation
- [x] Configure Flutter gen-l10n with English as the canonical ARB.
- [x] Add supported locale delegates and platform-locale fallback.
- [x] Add a persisted language preference with a System default.
- [x] Add first-wave locales: Spanish, French, German, Italian, Brazilian Portuguese, Dutch, Polish, Japanese, Korean, Simplified Chinese.

## App-wide string migration
- [ ] Navigation, app shell, update prompts, shared search/action UI.
- [ ] Diary screens, diary editing, repeat-entry flows, filters, summaries, empty states.
- [ ] Food and meal screens, editors, filters, barcode/Open Food Facts flows, empty states.
- [ ] Weight screens and editors.
- [ ] Graph/progress screens and metric labels.
- [ ] Settings and supporting pages including About and What's New.
- [ ] Import/export/backup/errors/snackbars and failed-migration UI.
- [ ] Notifications, notification channels, native platform-visible strings, accessibility labels/tooltips.

## Locale correctness
- [x] Locale-aware dates and times; remove English-only formatting assumptions.
- [x] Locale-aware numbers, decimal input/display, calories/nutrients/weights and units.
- [ ] ICU plurals/selects/placeholders for all count- and value-dependent copy.
- [ ] Keep persisted identifiers, storage/API values, logs/debug copy and user-entered content untranslated.

## Translation quality
- [ ] Complete every locale ARB with natural nutrition/fitness terminology and exact ICU placeholders.
- [x] Run automated key/placeholder completeness checks across every ARB.
- [x] Audit for accidental hard-coded user-visible English across Dart and native platform code.

## QA and release readiness
- [ ] Verify common screens under long translations and 200% text scale; fix overflow/layout issues without unnatural abbreviation.
- [ ] Add localization widget/unit tests and locale-switch persistence coverage.
- [x] Run gen-l10n, dart format, flutter analyze and flutter test cleanly.
- [ ] Validate Android/iOS/desktop platform-visible localized copy where supported.
- [ ] Final full-app localization audit and release-readiness pass.
