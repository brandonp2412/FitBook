#!/usr/bin/env python3
import argparse
import os
from pathlib import Path
import re
import shutil
import subprocess
import sys
import zipfile


CERTIFICATE = "011ee1a6e4e5ecd675f67fbf3d78ad82614a7a7a3f24ed71cc9c417154a0f0fd"
ABI_CODES = {"x86_64": 1, "armeabi-v7a": 2, "arm64-v8a": 3}


def android_tool(name):
    if tool := shutil.which(name):
        return tool
    sdk = os.environ.get("ANDROID_HOME") or os.environ.get("ANDROID_SDK_ROOT")
    if sdk:
        versions = [
            path for path in (Path(sdk) / "build-tools").glob("*")
            if re.fullmatch(r"\d+(\.\d+)+", path.name) and (path / name).is_file()
        ]
        if versions:
            return str(max(versions, key=lambda path: tuple(map(int, path.name.split(".")))) / name)
    raise ValueError(f"Cannot find Android SDK tool: {name}")


def verify(directory, pubspec):
    match = re.search(r"^version:\s*(\S+)\+(\d+)\s*$", pubspec.read_text(), re.MULTILINE)
    if not match:
        raise ValueError("Missing release version in pubspec.yaml")
    version, build = match.group(1), int(match.group(2))
    expected = {
        f"app-{abi}-release.apk": ({abi}, build * 10 + code)
        for abi, code in ABI_CODES.items()
    }
    expected["fitbook.apk"] = (set(ABI_CODES), build * 10 + 3)
    for name in expected:
        path = directory / name
        if not path.is_file() or not path.stat().st_size:
            raise ValueError(f"Missing release APK: {path}")
    aapt, apksigner = android_tool("aapt"), android_tool("apksigner")
    for name, (abis, code) in expected.items():
        path = directory / name
        badging = subprocess.check_output([aapt, "dump", "badging", str(path)], text=True)
        package = re.search(r"^package: name='([^']+)' versionCode='(\d+)' versionName='([^']+)'", badging, re.MULTILINE)
        if not package or package.groups() != ("com.presley.fit_book", str(code), version):
            raise ValueError(f"Wrong package or release version: {path}")
        with zipfile.ZipFile(path) as apk:
            libraries = {entry for entry in apk.namelist() if entry.startswith("lib/") and entry.endswith(".so")}
        actual_abis = {entry.split("/")[1] for entry in libraries}
        if actual_abis != abis:
            raise ValueError(f"Wrong architectures in {path}: {sorted(actual_abis)}; expected {sorted(abis)}")
        for abi in abis:
            for library in ("libflutter.so", "libapp.so"):
                if f"lib/{abi}/{library}" not in libraries:
                    raise ValueError(f"Missing {abi}/{library} in {path}")
        signing = subprocess.check_output([apksigner, "verify", "--print-certs", str(path)], text=True)
        certificates = set(re.findall(r"^(?:Signer #\d+|V\d+ Signer):? certificate SHA-256 digest: (\S+)$", signing, re.MULTILINE))
        if certificates != {CERTIFICATE}:
            raise ValueError(f"Wrong release signing certificate: {path}")
        print(f"Verified {name}: {version} ({code}), {', '.join(sorted(abis))}")


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("directory", type=Path)
    parser.add_argument("--pubspec", type=Path, default=Path("pubspec.yaml"))
    args = parser.parse_args()
    try:
        verify(args.directory, args.pubspec)
    except (ValueError, OSError, zipfile.BadZipFile, subprocess.CalledProcessError) as error:
        print(f"Release verification failed: {error}", file=sys.stderr)
        return 1
    return 0


if __name__ == "__main__":
    sys.exit(main())
