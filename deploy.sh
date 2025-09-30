#!/bin/bash

set -ex # Exit on any error

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

print_step() {
    echo -e "${BLUE}=== $1 ===${NC}"
}

print_success() {
    echo -e "${GREEN}✅ $1${NC}"
}

print_warning() {
    echo -e "${YELLOW}⚠️  $1${NC}"
}

print_error() {
    echo -e "${RED}❌ $1${NC}"
}

print_step "Calculating new version"
current_version=$(yq e '.version' pubspec.yaml)
IFS='+.' read -r major minor patch build_number <<<"$current_version"

new_patch=$((patch + 1))
new_build_number=$((build_number + 1))
changelog_number=$((new_build_number * 10 + 3))
new_flutter_version="$major.$minor.$new_patch+$new_build_number"
new_version="$major.$minor.$new_patch"

current_msix_version=$(yq e '.msix_config.msix_version' pubspec.yaml)
IFS='.' read -r msix_major msix_minor msix_patch msix_zero <<<"$current_msix_version"
new_msix_patch=$((msix_patch + 1))
new_msix_version="$msix_major.$msix_minor.$new_msix_patch.$msix_zero"

echo "Current version: $current_version"
echo "New version: $new_flutter_version"
echo "MSIX version: $new_msix_version"
echo "Changelog number: $changelog_number"

# Generate changelog
print_step "Generating changelog"
changelog_file="fastlane/metadata/android/en-US/changelogs/$changelog_number.txt"

# Use existing changelog if it exists
if [ -f "$changelog_file" ]; then
    print_warning "Using existing changelog file: $changelog_file"
    cat "$changelog_file"
    changelog=$(cat "$changelog_file")
    mkdir -p fastlane/metadata/en-AU
    echo "$changelog" >fastlane/metadata/en-AU/release_notes.txt
else
    mkdir -p "$(dirname "$changelog_file")"
    last_tag=$(git describe --tags --abbrev=0 2>/dev/null || echo "")

    # Generate changelog from git commits
    print_step "Generating changelog from git commits since $last_tag"
    git --no-pager log --pretty=format:'%s' "$last_tag"..HEAD |
        sort -u |
        grep -v "^Merge " |
        grep -v "^Release " |
        grep -v "^Bump " |
        grep -v "^Update " |
        grep -v "^[0-9]\+\.[0-9]\+\.[0-9]\+" |
        head -10 |
        sed 's/^/• /' >"$changelog_file"

    changelog=$(cat "$changelog_file")
    mkdir -p fastlane/metadata/en-AU
    echo "$changelog" >fastlane/metadata/en-AU/release_notes.txt
    nvim "$changelog_file"
fi

# Setup Flutter
print_step "Setting up Flutter from submodule"
if [ ! -d "flutter" ]; then
    print_warning "Flutter submodule not found, initializing..."
    git submodule update --init --recursive flutter
else
    git submodule update --recursive flutter
fi

export PATH="$PWD/flutter/bin:$PATH"
chmod +x flutter/bin/* # Ensure executables are runnable

# Run tests and analysis
print_step "Running tests and analysis"
flutter test
print_success "Tests passed"

dart analyze lib
print_success "Analysis passed"

dart format --set-exit-if-changed lib
print_success "Code formatting verified"

# Update versions in pubspec.yaml
print_step "Updating versions in pubspec.yaml"
yq e ".version |= \"$new_flutter_version\"" -i pubspec.yaml
yq e ".msix_config.msix_version |= \"$new_msix_version\"" -i pubspec.yaml
print_success "Updated pubspec.yaml versions"

# Copy changelog
print_step "Copying changelogs with timestamps"
timestamp=$(stat --format="%W" "$changelog_file")
target_file="assets/changelogs/$timestamp.txt"
cp "$changelog_file" "$target_file"

generate_screenshots() {
    local avd_name=$1

    print_step "Generating screenshots for AVD '$avd_name'"

    if ! command -v emulator &>/dev/null || ! emulator -list-avds | grep -q "^$avd_name$"; then
        print_warning "AVD '$avd_name' not found"
        echo "Available AVDs:"
        emulator -list-avds 2>/dev/null || echo "None found"
        return 1
    fi

    print_step "Starting emulator '$avd_name'"
    emulator -avd "$avd_name" -no-window -gpu swiftshader_indirect -noaudio -no-boot-anim -camera-back none &
    emulator_pid=$!

    # Wait for emulator to appear and get its ID
    echo "Waiting for emulator to boot..."
    timeout=300
    elapsed=0
    emulator_id=""

    while [ $elapsed -lt $timeout ]; do
        # Get any emulator that's now running (should be ours since we killed others)
        emulator_id=$(adb devices | grep "emulator-" | grep "device$" | awk '{print $1}' | head -1)

        if [ -n "$emulator_id" ]; then
            print_success "Emulator '$avd_name' booted with ID: $emulator_id"
            break
        fi

        # Check if process died
        if ! kill -0 "$emulator_pid" 2>/dev/null; then
            print_error "Emulator process died during startup"
            exit 1
        fi

        sleep 5
        elapsed=$((elapsed + 5))
        echo "Waiting... ($elapsed/${timeout}s)"
    done

    if [ -z "$emulator_id" ]; then
        print_error "Emulator '$avd_name' failed to boot within timeout"
        kill $emulator_pid 2>/dev/null || true
        exit 1
    fi

    # Wait for system to settle
    echo "Waiting for system to settle..."
    sleep 15

    # Verify emulator is still available
    if ! adb devices | grep -q "$emulator_id.*device"; then
        print_error "Emulator $emulator_id disappeared"
        kill $emulator_pid 2>/dev/null || true
        exit 1
    fi

    print_step "Running screenshot tests on $emulator_id for device type '$avd_name'"
    export FITBOOK_DEVICE_TYPE="$avd_name"

    if flutter drive --profile --driver=test_driver/integration_test.dart \
        --dart-define=FITBOOK_DEVICE_TYPE=$avd_name \
        --target=integration_test/screenshot_test.dart -d "$emulator_id"; then
        print_success "Screenshots generated successfully for '$avd_name'"
    else
        print_error "Screenshot generation failed for '$avd_name'"
        adb -s "$emulator_id" emu kill 2>/dev/null || kill $emulator_pid 2>/dev/null || true
        exit 1
    fi

    print_step "Stopping emulator '$avd_name'"
    adb -s "$emulator_id" emu kill 2>/dev/null || kill $emulator_pid 2>/dev/null || true

    # Wait for shutdown
    sleep 5
    print_success "Emulator '$avd_name' stopped"
}

if [[ "$*" == *"-n"* ]]; then
    generate_screenshots phoneScreenshots
    generate_screenshots sevenInchScreenshots
    generate_screenshots tenInchScreenshots
else
    print_warning "Android SDK not properly configured. Skipping screenshot generation."
    echo "Make sure Android SDK and emulator tools are in your PATH"
fi

# Commit changes and create tag
print_step "Committing version bump and creating tag"

# Check if there are changes to commit
if ! git diff --quiet HEAD -- pubspec.yaml fastlane/metadata pubspec.lock assets; then
    git add pubspec.yaml fastlane/metadata pubspec.lock assets
    git commit -m "Release $new_version"
    print_success "Committed version bump"

    # Create tag
    git tag "$new_version"
    print_success "Created tag: $new_version"

    echo ""
    print_step "Next steps:"
    echo "1. Push changes: git push origin main"
    echo "2. Push tag: git push origin $new_version"
    echo "3. The GitHub Action will handle deployment automatically"
    echo ""
    print_success "Local build process completed successfully!"
    echo "Version: $new_version"
    echo "Tag: $new_version"
else
    print_warning "No changes detected in tracked files"
fi

flutter build linux
flutter config --enable-web
flutter build web --release
git pull origin main
git push
git push origin "$new_version"
