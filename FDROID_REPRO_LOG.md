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

## Attempt 4 (current) — Correct CI to `--split-per-abi --target-platform` (IN PROGRESS)
