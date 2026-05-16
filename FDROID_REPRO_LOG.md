# F-Droid Reproducibility Failure Log

Reference build job: https://gitlab.com/fdroid/checkupdates-bot-fdroiddata/-/jobs/14294521273
fdroiddata MR: https://gitlab.com/fdroid/fdroiddata/-/merge_requests/38323

---

## Attempt 1 — Fix CI: `--split-per-abi` → `--target-platform` per ABI (WRONG)

**Hypothesis:** `flutter build apk --split-per-abi` embeds all three ABI entries in
`NativeAssetsManifest.json` in every split APK. Building each ABI separately with
`--target-platform android-x64` would produce a manifest with only `android_x64`.

**What was done:**
- Changed GitHub CI from `flutter build apk --split-per-abi` to three separate calls:
  `flutter build apk --release --target-platform android-x64` (etc.)
- fdroiddata MR: added 2.0.38 entries with `ndk: r28c`

**Why it failed:**
1. The 2.0.38 reference APKs were already published with the old CI (all-arch manifest) —
   the MR could never pass for that version.
2. `--target-platform android-x64` WITHOUT `--split-per-abi` produces a **universal** APK,
   not a split APK. The universal APK:
   - Gets `versionCodeOverride = versionCode * 10 + 3` (arm64 fallback in build.gradle)
     instead of `* 10 + 1` (x86_64)
   - Includes native asset libs for ALL ABIs (arm64-v8a, armeabi-v7a, x86_64)
   F-Droid builds a split x86_64 APK (only x86_64 libs, versionCode *10+1).
   These are structurally different APKs.

---

## Attempt 2 — Skip 2.0.38, target 2.0.39 (WRONG)

**Hypothesis:** 2.0.39 would be built with the (incorrectly) fixed CI.

**What was done:**
- Updated MR to use 2.0.39 entries.
- Added `sed -i 's/-Wl,/-Wl,--build-id=none,/'` to fdroiddata prebuild for libdartjni.so.
- Force-pushed MR.

**Why it failed:**
- The 2.0.39 reference APK was built with `--target-platform android-x64` (no `--split-per-abi`),
  so it was a universal APK with wrong versionCode (1583) and all ABI libs.
- F-Droid's x86_64 build expects versionCode 1581 and only x86_64 libs.
- `rewritemeta` also failed: `binary:` fields in my new entries were missing a trailing space
  (canonical format requires `binary: ` with trailing space).

---

## Attempt 3 — Fix rewritemeta trailing space, target 2.0.40 (WRONG)

**Hypothesis:** 2.0.40 would be built with the same broken CI plus the build-id fix, and
fixing the trailing space on `binary:` would unblock `rewritemeta`.

**What was done:**
- Fixed trailing space on `binary:` lines in fdroiddata entries.
- Added `--build-id=none` sed patch to fdroiddata prebuild AND GitHub CI.
- Triggered workflow_dispatch to build 2.0.40.
- Updated MR to 2.0.40 entries (versionCodes 1581/1582/1583, commit 82741ff).

**Why it failed (fdroid build job, pipeline 2529187630):**
Three diffs between reference and F-Droid build:

1. `AndroidManifest.xml` binary differs — reference versionCode is 1583 (arm64/universal),
   F-Droid builds x86_64 split with expected versionCode 1581.

2. Reference has `lib/arm64-v8a/` and `lib/armeabi-v7a/` — F-Droid's split x86_64 build
   only has `lib/x86_64/`. Root cause: `--target-platform android-x64` without
   `--split-per-abi` includes native asset libs for all ABIs.

3. `lib/x86_64/libdartjni.so` still differs — possibly NDK version or build-id fix not
   applied correctly.

---

## Root cause (confirmed from build.gradle inspection)

`android/app/build.gradle` applies versionCode overrides:
```groovy
ext.abiCodes = ["x86_64": 1, "armeabi-v7a": 2, "arm64-v8a": 3]
// universal APK (no ABI filter) → versionCode * 10 + 3
```

F-Droid metadata VercodeOperation: `10 * %c + 1` for x64.
This only matches when the APK has ABI filter = x86_64 (i.e., built with `--split-per-abi`).

**The correct build command** (matching exactly what F-Droid's metadata uses):
```
flutter build apk --release --split-per-abi --target-platform android-x64
```
This produces a split APK with:
- versionCode = base * 10 + 1 = 1581 ✓
- Only x86_64 native libs ✓
- NativeAssetsManifest.json: only android_x64 ✓ (proven: F-Droid's own builds show this)

The `--build-id=none` sed fix is still needed for libdartjni.so.

---

## Attempt 4 — Correct CI to `--split-per-abi --target-platform` (WRONG version targeted)

**Hypothesis:** Commit `97d8fde` (CI fix: `--split-per-abi --target-platform` per ABI +
`--build-id=none` sed) would produce correct 2.0.40 reference APKs.

**What was done:**
- Pushed CI fix commit `97d8fde` to main (force-push).
- Version-bump CI job failed: `fatal: tag '2.0.39' already exists` (force-push orphaned
  the previous version-bump commit, leaving pubspec at `2.0.39+157` with tags 2.0.38/39/40
  all existing).
- MR `!38323` targeting 2.0.40 was accidentally merged by licaon-kter (despite failing
  CI), then immediately reverted with commit `b224dc363`.

**Why it failed:**
The version-bump tag conflict meant 2.0.41 was never built with the correct CI.
The fdroid pipeline ran against the 2.0.40 reference APK which was built with the
WRONG CI (universal APK).

---

## Attempt 5 — 2.0.41 fdroiddata format issues (WRONG)

**What was done:** MR !38408 opened targeting 2.0.41. Three sub-failures:

1. `fdroid rewritemeta` failed: local rewritemeta (newer version) uses inline `binary: url`
   format; fdroid CI's rewritemeta wants multi-line `binary: \n  url` with trailing space.
   **Fix:** Don't run local rewritemeta; commit in the multi-line format the CI expects.

2. `fdroid rewritemeta` failed again: blank line count wrong — two blank lines before first
   new entry (needs one), missing blank line before `AllowedAPKSigningKeys` (needs one).
   **Fix:** Corrected blank lines exactly as the CI diff showed.

3. `fdroid build` failed: `libdartjni.so` differs. Root cause: `PUB_CACHE` env var was
   set with `export` (local to that step only), so `flutter build apk` in the next step
   defaulted to `~/.pub-cache`, re-downloaded `jni` fresh WITHOUT the `--build-id=none`
   sed patch. F-Droid used the patched cache; reference APK did not → mismatch.

---

## Attempt 6 — 2.0.42 with PUB_CACHE persisted via GITHUB_ENV (SUCCESS ✓)

**What was done:**
- Added `echo "PUB_CACHE=$(pwd)/.pub-cache" >> $GITHUB_ENV` to the "Setup Flutter"
  step in `.github/workflows/main.yml` so PUB_CACHE persists across all subsequent steps.
- Bumped pubspec to `2.0.40+158` [skip ci], triggered workflow_dispatch → built 2.0.42
  (versionCodes 1601/1602/1603, commit `9d728fc9`).
- Updated fdroiddata MR !38408 to 2.0.42 entries.

**Result:** GitLab pipeline 2529432418 — ALL 9 JOBS PASS ✓
- check apk ✓
- check source code ✓
- schema validation ✓
- tools check scripts ✓
- fdroid rewritemeta ✓
- fdroid lint ✓
- git redirect ✓
- checkupdates ✓
- fdroid build ✓ (reproducibility check passed — libdartjni.so matches)

MR: https://gitlab.com/fdroid/fdroiddata/-/merge_requests/38408
