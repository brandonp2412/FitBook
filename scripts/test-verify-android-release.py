import contextlib
import importlib.util
import io
from pathlib import Path
import subprocess
import tempfile
import unittest
from unittest.mock import patch
import zipfile


spec = importlib.util.spec_from_file_location("verify_release", Path(__file__).with_name("verify-android-release.py"))
release = importlib.util.module_from_spec(spec)
spec.loader.exec_module(release)


class ReleaseVerificationTest(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory()
        self.addCleanup(self.temp.cleanup)
        self.directory = Path(self.temp.name)
        self.pubspec = self.directory / "pubspec.yaml"
        self.pubspec.write_text("version: 2.0.113+231\n")
        self.packages = {}
        for abi, code in release.ABI_CODES.items():
            name = f"app-{abi}-release.apk"
            self.write_apk(name, {abi})
            self.packages[name] = ("com.presley.fit_book", 2310 + code, "2.0.113")
        self.write_apk("fitbook.apk", set(release.ABI_CODES))
        self.packages["fitbook.apk"] = ("com.presley.fit_book", 2313, "2.0.113")
        self.certificate = release.CERTIFICATE
        self.signer = "Signer #1"
        self.command_error = False
        self.addCleanup(patch.stopall)
        patch.object(release, "android_tool", side_effect=lambda name: name).start()
        patch.object(release.subprocess, "check_output", side_effect=self.tool_output).start()

    def write_apk(self, name, abis, libraries=("libflutter.so", "libapp.so")):
        with zipfile.ZipFile(self.directory / name, "w") as apk:
            for abi in abis:
                for library in libraries:
                    apk.writestr(f"lib/{abi}/{library}", b"fixture")

    def tool_output(self, command, **kwargs):
        if command[0] == "aapt":
            package, code, version = self.packages[Path(command[-1]).name]
            return f"package: name='{package}' versionCode='{code}' versionName='{version}'\n"
        if self.command_error:
            raise subprocess.CalledProcessError(1, command)
        return f"{self.signer} certificate SHA-256 digest: {self.certificate}\n"

    def verify(self):
        with contextlib.redirect_stdout(io.StringIO()):
            release.verify(self.directory, self.pubspec)

    def test_complete_release(self):
        self.verify()

    def test_new_apksigner_output(self):
        self.signer = "V2 Signer:"
        self.verify()

    def test_missing_split_with_other_files_present(self):
        (self.directory / "app-x86_64-release.apk").unlink()
        with self.assertRaisesRegex(ValueError, "Missing release APK"):
            self.verify()

    def test_universal_apk_renamed_as_split(self):
        self.write_apk("app-x86_64-release.apk", set(release.ABI_CODES))
        with self.assertRaisesRegex(ValueError, "Wrong architectures"):
            self.verify()

    def test_stale_version_or_wrong_abi_version_code(self):
        for package in [("com.presley.fit_book", 2301, "2.0.112"), ("com.presley.fit_book", 2313, "2.0.113"), ("other.app", 2311, "2.0.113")]:
            with self.subTest(package=package):
                self.packages["app-x86_64-release.apk"] = package
                with self.assertRaisesRegex(ValueError, "Wrong package or release version"):
                    self.verify()

    def test_incomplete_native_libraries(self):
        self.write_apk("app-x86_64-release.apk", {"x86_64"}, ("libflutter.so",))
        with self.assertRaisesRegex(ValueError, "Missing x86_64/libapp.so"):
            self.verify()

    def test_wrong_signing_key(self):
        self.certificate = "0" * 64
        with self.assertRaisesRegex(ValueError, "Wrong release signing certificate"):
            self.verify()

    def test_invalid_signature(self):
        self.command_error = True
        with self.assertRaises(subprocess.CalledProcessError):
            self.verify()


if __name__ == "__main__":
    unittest.main()
