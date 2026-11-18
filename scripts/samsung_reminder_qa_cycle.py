#!/usr/bin/env python3
"""Safely install signed FitBook release, run the actual WorkManager job.

The installed app's certificate and data are preserved. This no longer
installs any debug APK or requires a Kotlin reminder test receiver.
"""

import argparse
import re
import subprocess
import tempfile
from pathlib import Path

PACKAGE = 'com.presley.fit_book'


def run(*args, timeout=120):
    process = subprocess.run(args, capture_output=True, text=True, timeout=timeout)
    if process.returncode:
        raise RuntimeError(f"{' '.join(args[:4])}: {process.stderr[-420:]}")
    return process.stdout


def signature(path):
    text = run('apksigner', 'verify', '--print-certs', str(path), timeout=35)
    digest = re.search(r'V2 Signer: certificate SHA-256 digest: ([0-9a-fA-F]+)', text)
    if not digest:
        raise RuntimeError('Cannot validate signing certificate')
    return digest.group(1).lower()


def version(path):
    text = run('/opt/android-sdk/build-tools/37.0.0/aapt', 'dump',
               'badging', str(path), timeout=35)
    result = re.search(r"package: name='([^']+)' versionCode='(\d+)'", text)
    if not result or result.group(1) != PACKAGE:
        raise RuntimeError(f'Unexpected APK identity: {path}')
    return int(result.group(2))


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--device', default='10.66.66.3:5555')
    parser.add_argument('--release-apk', type=Path, required=True)
    parser.add_argument('--preflight-only', action='store_true')
    args = parser.parse_args()
    release = args.release_apk.resolve(strict=True)
    new_version = version(release)
    existing = run('adb', '-s', args.device, 'shell', 'pm', 'path', PACKAGE)
    package_path = next((line.partition('package:')[2].strip()
                         for line in existing.splitlines()
                         if line.startswith('package:')), None)
    if not package_path:
        raise RuntimeError('FitBook must already be installed')
    with tempfile.TemporaryDirectory(prefix='fitbook-release-verify-') as directory:
        apk = Path(directory) / 'installed.apk'
        run('adb', '-s', args.device, 'pull', package_path, str(apk), timeout=120)
        old_version = version(apk)
        if signature(apk) != signature(release):
            raise RuntimeError('Signing certificate mismatch; refusing to install')
        if new_version < old_version:
            raise RuntimeError('Refusing to downgrade FitBook')
    print(f'PASS: safe signed in-place update: {old_version} -> {new_version}', flush=True)
    if args.preflight_only:
        return
    print(run('adb', '-s', args.device, 'install', '-r', str(release), timeout=180), flush=True)
    run('adb', '-s', args.device, 'shell', 'am', 'start', '-n', f'{PACKAGE}/.MainActivity')
    print(run('python3', str(Path(__file__).with_name('samsung_reminder_smoke.py')),
        '--device', args.device, timeout=130), flush=True)
    print('PASS: signed release installed and scheduled WorkManager job verified', flush=True)


if __name__ == '__main__':
    main()
