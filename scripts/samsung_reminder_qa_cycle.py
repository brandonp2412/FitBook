#!/usr/bin/env python3
"""Safely install a signed debug FitBook, smoke-test reminders, restore release.

Pass two APKs signed by the installed FitBook certificate. The existing app is
updated in place (never uninstalled), retaining its diary, settings and backups.
"""

import argparse
import re
import subprocess
import sys
import tempfile
from pathlib import Path

import samsung_reminder_smoke as smoke

PACKAGE = "com.presley.fit_book"


def checked(*args, timeout=120):
    result = subprocess.run(args, capture_output=True, text=True, timeout=timeout)
    if result.returncode:
        raise RuntimeError(f"{' '.join(args[:4])} failed: {result.stderr[-500:]}")
    return result.stdout


def signer(apk):
    output = checked("apksigner", "verify", "--print-certs", str(apk), timeout=35)
    match = re.search(r"V2 Signer: certificate SHA-256 digest: ([0-9a-fA-F]+)", output)
    if not match:
        raise RuntimeError(f"Missing verified APK v2 certificate: {apk}")
    return match.group(1).lower()


def apkMetadata(apk):
    output = checked("/opt/android-sdk/build-tools/37.0.0/aapt", "dump", "badging", str(apk), timeout=25)
    match = re.search(r"package: name='([^']+)' versionCode='(\d+)'", output)
    if not match or match.group(1) != PACKAGE:
        raise RuntimeError(f"Wrong package: {apk}")
    return int(match.group(2))


def manifestHasTestReceiver(apk):
    output = checked("/opt/android-sdk/build-tools/37.0.0/aapt", "dump", "xmltree", str(apk), "AndroidManifest.xml", timeout=25)
    return "MealReminderTestReceiver" in output


def install(device, apk, isDebug):
    args = ["adb", "-s", device, "install", "-r"]
    if isDebug:
        args.append("-t")
    print(checked(*args, str(apk), timeout=180).strip(), flush=True)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--device", default="10.66.66.3:5555")
    parser.add_argument("--debug-apk", type=Path, required=True)
    parser.add_argument("--release-apk", type=Path, required=True)
    parser.add_argument("--preflight-only", action="store_true")
    args = parser.parse_args()

    debug = args.debug_apk.resolve(strict=True)
    release = args.release_apk.resolve(strict=True)
    debugVersion = apkMetadata(debug)
    releaseVersion = apkMetadata(release)
    if releaseVersion < debugVersion:
        raise RuntimeError("Release APK must not be older than test APK")
    if not manifestHasTestReceiver(debug) or manifestHasTestReceiver(release):
        raise RuntimeError("Debug must contain QA receiver; release must omit it")
    if signer(debug) != signer(release):
        raise RuntimeError("Debug and release APKs are signed by different keys")

    pathResult = checked("adb", "-s", args.device, "shell", "pm", "path", PACKAGE)
    installedPath = next((line.split("package:", 1)[1].strip()
                          for line in pathResult.splitlines() if line.startswith("package:")), None)
    if not installedPath:
        raise RuntimeError("FitBook is not installed; refusing first-time deployment")
    with tempfile.TemporaryDirectory(prefix="fitbook-reminder-signature-") as temp:
        installed = Path(temp) / "installed.apk"
        checked("adb", "-s", args.device, "pull", installedPath, str(installed), timeout=120)
        installedVersion = apkMetadata(installed)
        if signer(installed) != signer(debug):
            raise RuntimeError("Signature mismatch with installed FitBook; refusing install")
        if debugVersion < installedVersion:
            raise RuntimeError("Debug APK would downgrade FitBook; rebuild with newer versionCode")
    print(f"PASS: same signing key, installed={installedVersion}, debug={debugVersion}, release={releaseVersion}", flush=True)
    if args.preflight_only:
        return

    installedDebug = False
    try:
        install(args.device, debug, isDebug=True)
        installedDebug = True
        checked("adb", "-s", args.device, "shell", "am", "start", "-n", f"{PACKAGE}/.MainActivity", timeout=35)
        checked(sys.executable, str(Path(__file__).with_name("samsung_reminder_smoke.py")),
                "--device", args.device, timeout=240)
        print("PASS: real Samsung smoke suite", flush=True)
    finally:
        if installedDebug:
            print("Restoring production signed release (in-place, preserving app data)", flush=True)
            install(args.device, release, isDebug=False)
            checked("adb", "-s", args.device, "shell", "am", "start", "-n", f"{PACKAGE}/.MainActivity", timeout=35)
            smoke.assertRealAlarm(args.device)
            print("PASS: production FitBook restored, real meal alarms scheduled", flush=True)


if __name__ == "__main__":
    main()
