#Requires -Version 5.1
Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

function Print-Step($msg)    { Write-Host "=== $msg ===" -ForegroundColor Blue }
function Print-Success($msg) { Write-Host "✅ $msg" -ForegroundColor Green }
function Print-Warning($msg) { Write-Host "⚠️  $msg" -ForegroundColor Yellow }
function Print-Error($msg)   { Write-Host "❌ $msg" -ForegroundColor Red }

# ---------------------------------------------------------------------------
# Calculate new version
# ---------------------------------------------------------------------------
Print-Step "Calculating new version"
$currentVersion = (yq e '.version' pubspec.yaml).Trim()
# Format: major.minor.patch+build
if ($currentVersion -notmatch '^(\d+)\.(\d+)\.(\d+)\+(\d+)$') {
    throw "Unexpected version format: $currentVersion"
}
$major       = $Matches[1]
$minor       = $Matches[2]
$patch       = [int]$Matches[3]
$buildNumber = [int]$Matches[4]

$newPatch          = $patch + 1
$newBuildNumber    = $buildNumber + 1
$changelogNumber   = $newBuildNumber * 10 + 3
$newFlutterVersion = "$major.$minor.$newPatch+$newBuildNumber"
$newVersion        = "$major.$minor.$newPatch"

$currentMsixVersion = (yq e '.msix_config.msix_version' pubspec.yaml).Trim()
if ($currentMsixVersion -notmatch '^(\d+)\.(\d+)\.(\d+)\.(\d+)$') {
    throw "Unexpected MSIX version format: $currentMsixVersion"
}
$msixMajor   = $Matches[1]
$msixMinor   = $Matches[2]
$msixPatch   = [int]$Matches[3]
$msixZero    = $Matches[4]
$newMsixVersion = "$msixMajor.$msixMinor.$($msixPatch + 1).$msixZero"

Write-Host "Current version  : $currentVersion"
Write-Host "New version      : $newFlutterVersion"
Write-Host "MSIX version     : $newMsixVersion"
Write-Host "Changelog number : $changelogNumber"

# ---------------------------------------------------------------------------
# Generate changelog
# ---------------------------------------------------------------------------
Print-Step "Generating changelog"
$changelogFile = "fastlane/metadata/android/en-US/changelogs/$changelogNumber.txt"

if (Test-Path $changelogFile) {
    Print-Warning "Using existing changelog file: $changelogFile"
    Get-Content $changelogFile
    $changelog = Get-Content $changelogFile -Raw
    New-Item -ItemType Directory -Force -Path "fastlane/metadata/en-AU" | Out-Null
    Set-Content "fastlane/metadata/en-AU/release_notes.txt" $changelog -NoNewline
} else {
    New-Item -ItemType Directory -Force -Path (Split-Path $changelogFile) | Out-Null
    $lastTag = git describe --tags --abbrev=0 2>$null
    if (-not $lastTag) { $lastTag = "" }

    Print-Step "Generating changelog from git commits since $lastTag"
    $range = if ($lastTag) { "$lastTag..HEAD" } else { "HEAD" }
    $commits = git --no-pager log --pretty=format:'%s' $range |
        Sort-Object -Unique |
        Where-Object { $_ -notmatch '^Merge '   } |
        Where-Object { $_ -notmatch '^Release ' } |
        Where-Object { $_ -notmatch '^Bump '    } |
        Where-Object { $_ -notmatch '^Update '  } |
        Where-Object { $_ -notmatch '^\d+\.\d+\.\d+' } |
        Select-Object -First 10 |
        ForEach-Object { "• $_" }

    Set-Content $changelogFile ($commits -join "`n") -NoNewline
    $changelog = Get-Content $changelogFile -Raw
    New-Item -ItemType Directory -Force -Path "fastlane/metadata/en-AU" | Out-Null
    Set-Content "fastlane/metadata/en-AU/release_notes.txt" $changelog -NoNewline

    # Open changelog for editing (uses default .txt editor; swap for notepad/code if preferred)
    Start-Process -FilePath $changelogFile -Wait
}

# ---------------------------------------------------------------------------
# Setup Flutter
# ---------------------------------------------------------------------------
Print-Step "Setting up Flutter from submodule"
if (-not (Test-Path "flutter")) {
    Print-Warning "Flutter submodule not found, initializing..."
    git submodule update --init --recursive flutter
} else {
    git submodule update --recursive flutter
}

$env:PATH = "$PWD\flutter\bin;$env:PATH"

# ---------------------------------------------------------------------------
# Tests and analysis
# ---------------------------------------------------------------------------
Print-Step "Running tests and analysis"
flutter test
Print-Success "Tests passed"

dart analyze lib
Print-Success "Analysis passed"

dart format --set-exit-if-changed lib
Print-Success "Code formatting verified"

# ---------------------------------------------------------------------------
# Update versions in pubspec.yaml
# ---------------------------------------------------------------------------
Print-Step "Updating versions in pubspec.yaml"
yq e ".version |= `"$newFlutterVersion`"" -i pubspec.yaml
yq e ".msix_config.msix_version |= `"$newMsixVersion`"" -i pubspec.yaml
Print-Success "Updated pubspec.yaml versions"

# ---------------------------------------------------------------------------
# Copy changelog with creation timestamp
# ---------------------------------------------------------------------------
Print-Step "Copying changelogs with timestamps"
$timestamp = (Get-Item $changelogFile).CreationTime.ToFileTime()
$targetFile = "assets/changelogs/$timestamp.txt"
Copy-Item $changelogFile $targetFile

# ---------------------------------------------------------------------------
# Screenshot generation (opt-in with -Screenshots flag)
# ---------------------------------------------------------------------------
function Generate-Screenshots {
    param([string]$AvdName)

    Print-Step "Generating screenshots for AVD '$AvdName'"

    if (-not (Get-Command emulator -ErrorAction SilentlyContinue)) {
        Print-Warning "emulator not found in PATH"
        return $false
    }

    $avds = emulator -list-avds 2>$null
    if ($avds -notcontains $AvdName) {
        Print-Warning "AVD '$AvdName' not found"
        Write-Host "Available AVDs:"
        $avds | ForEach-Object { Write-Host "  $_" }
        return $false
    }

    Print-Step "Starting emulator '$AvdName'"
    $emulatorProc = Start-Process -FilePath emulator `
        -ArgumentList "-avd `"$AvdName`" -no-window -gpu swiftshader_indirect -noaudio -no-boot-anim -camera-back none" `
        -PassThru

    Write-Host "Waiting for emulator to boot..."
    $timeout = 300
    $elapsed = 0
    $emulatorId = ""

    while ($elapsed -lt $timeout) {
        $emulatorId = adb devices |
            Select-String 'emulator-\S+\s+device$' |
            ForEach-Object { ($_ -split '\s+')[0] } |
            Select-Object -First 1

        if ($emulatorId) {
            Print-Success "Emulator '$AvdName' booted with ID: $emulatorId"
            break
        }

        if ($emulatorProc.HasExited) {
            Print-Error "Emulator process died during startup"
            exit 1
        }

        Start-Sleep 5
        $elapsed += 5
        Write-Host "Waiting... ($elapsed/${timeout}s)"
    }

    if (-not $emulatorId) {
        Print-Error "Emulator '$AvdName' failed to boot within timeout"
        Stop-Process -Id $emulatorProc.Id -Force -ErrorAction SilentlyContinue
        exit 1
    }

    Write-Host "Waiting for system to settle..."
    Start-Sleep 15

    $stillUp = adb devices | Select-String "$emulatorId.*device"
    if (-not $stillUp) {
        Print-Error "Emulator $emulatorId disappeared"
        Stop-Process -Id $emulatorProc.Id -Force -ErrorAction SilentlyContinue
        exit 1
    }

    Print-Step "Running screenshot tests on $emulatorId for device type '$AvdName'"
    $env:FITBOOK_DEVICE_TYPE = $AvdName

    $result = flutter drive --profile `
        --driver=test_driver/integration_test.dart `
        "--dart-define=FITBOOK_DEVICE_TYPE=$AvdName" `
        --target=integration_test/screenshot_test.dart `
        -d $emulatorId

    if ($LASTEXITCODE -eq 0) {
        Print-Success "Screenshots generated successfully for '$AvdName'"
    } else {
        Print-Error "Screenshot generation failed for '$AvdName'"
        adb -s $emulatorId emu kill 2>$null
        Stop-Process -Id $emulatorProc.Id -Force -ErrorAction SilentlyContinue
        exit 1
    }

    Print-Step "Stopping emulator '$AvdName'"
    adb -s $emulatorId emu kill 2>$null
    if (-not $emulatorProc.HasExited) {
        Stop-Process -Id $emulatorProc.Id -Force -ErrorAction SilentlyContinue
    }
    Start-Sleep 5
    Print-Success "Emulator '$AvdName' stopped"
}

if ($args -contains '-n') {
    Generate-Screenshots "phoneScreenshots"
    Generate-Screenshots "sevenInchScreenshots"
    Generate-Screenshots "tenInchScreenshots"
} else {
    Print-Warning "Android SDK not properly configured. Skipping screenshot generation."
    Write-Host "Make sure Android SDK and emulator tools are in your PATH"
}

# ---------------------------------------------------------------------------
# Commit, tag, build, push
# ---------------------------------------------------------------------------
Print-Step "Committing version bump and creating tag"

$changed = git diff --quiet HEAD -- pubspec.yaml fastlane/metadata pubspec.lock assets
if ($LASTEXITCODE -ne 0) {
    git add pubspec.yaml fastlane/metadata pubspec.lock assets
    git commit -m "Release $newVersion"
    Print-Success "Committed version bump"

    git tag $newVersion
    Print-Success "Created tag: $newVersion"

    Write-Host ""
    Print-Step "Next steps:"
    Write-Host "1. Push changes: git push origin main"
    Write-Host "2. Push tag:     git push origin $newVersion"
    Write-Host "3. The GitHub Action will handle deployment automatically"
    Write-Host ""
    Print-Success "Local build process completed successfully!"
    Write-Host "Version : $newVersion"
    Write-Host "Tag     : $newVersion"
} else {
    Print-Warning "No changes detected in tracked files"
}

flutter build linux
flutter config --enable-web
flutter build web --release
git pull origin main
git push
git push origin $newVersion
