#!/bin/bash

set -ex

export PUB_SUMMARY_ONLY=true

IFS='+.' read -r major minor patch build_number <<<"$(yq -r .version pubspec.yaml)"
new_patch=$((patch + 1))
new_build_number=$((build_number + 1))
changelog_number=$((new_build_number * 10 + 3))
new_flutter_version="$major.$minor.$new_patch+$new_build_number"
new_version="$major.$minor.$new_patch"
apk=$PWD/build/app/outputs/flutter-apk

IFS='+.' read -r msix_major msix_minor msix_patch msix_zero <<<"$(yq -r .msix_config.msix_version pubspec.yaml)"
new_msix_patch=$((msix_patch + 1))
new_msix_version="$msix_major.$msix_minor.$new_msix_patch.$msix_zero"

changelog_file="fastlane/metadata/android/en-US/changelogs/$changelog_number.txt"
if ! [ -f $changelog_file ]; then
  git --no-pager log --pretty=format:'%s' "$(git describe --tags --abbrev=0)"..HEAD |
    awk '{print "- "$0}' >$changelog_file
fi

nvim "$changelog_file"

if ! [ -f "$changelog_file" ]; then
  echo "No changelog was specified."
  exit 0
fi

changelog=$(cat "$changelog_file")
echo "$changelog" >"$changelog_file"
echo "$changelog" >fastlane/metadata/en-AU/release_notes.txt
echo "$changelog" >fastlane/metadata/en-US/release_notes.txt

if [[ $* == *-t* ]]; then
  echo "Skipping tests..."
else
  ./flutter/bin/flutter test
  dart analyze lib
  dart format --set-exit-if-changed lib
  ./scripts/migrate.sh
  ./scripts/screenshots.sh "phoneScreenshots"
  ./scripts/screenshots.sh "sevenInchScreenshots"
  ./scripts/screenshots.sh "tenInchScreenshots"
fi

yq -yi ".version |= \"$new_flutter_version\"" pubspec.yaml
yq -yi ".msix_config.msix_version |= \"$new_msix_version\"" pubspec.yaml
git add pubspec.yaml
git add fastlane/metadata
git commit -m "$new_version 🚀

$changelog"

./flutter/bin/flutter build apk --split-per-abi
adb -d install "$apk"/app-arm64-v8a-release.apk || true
./flutter/bin/flutter build apk
mv "$apk"/app-release.apk "$apk/fitbook.apk"
./flutter/bin/flutter build appbundle

mkdir -p build/native_assets/linux
./flutter/bin/flutter build linux
(cd "$apk/pipeline/linux/x64/release/bundle" && zip --quiet -r "fitbook-linux.zip" .)

docker start windows
rsync -a --delete --exclude-from=.gitignore --exclude flutter ./* .gitignore \
  "$HOME/windows/fitbook-source"
while ! ssh windows exit; do sleep 1; done
ssh windows 'Powershell -ExecutionPolicy bypass -File //host.lan/Data/build-fitbook.ps1'
sudo chown -R "$USER" "$HOME/windows/fitbook"
mv "$HOME/windows/fitbook/fit_book.msix" "$HOME/windows/fitbook.msix"
(cd "$HOME/windows/fitbook" && zip --quiet -r "$HOME/windows/fitbook-windows.zip" .)
docker stop windows

git push
gh release create "$new_version" --notes "$changelog" \
  "$apk"/app-*-release.apk \
  "$apk/pipeline/linux/x64/release/bundle/fitbook-linux.zip" \
  "$apk/fitbook.apk" \
  "$HOME/windows/fitbook-windows.zip"
git pull

if [[ $* == *-w* ]]; then
  echo "Skipping Windows store..."
else
  appId="$(yq -r .msix_config.msstore_appId pubspec.yaml)"
  msstore publish -id "$appId" "$HOME/windows/fitbook.msix"
fi

if [[ $* == *-p* ]]; then
  echo "Skipping Google play..."
else
  bundle exec fastlane supply --aab \
    build/app/outputs/bundle/release/app-release.aab || true
fi

if [[ $* == *-m* ]]; then
  echo "Skipping MacOS..."
else
  set +x
  ip=$(arp | grep "$MACBOOK_MAC" | cut -d ' ' -f 1)
  # shellcheck disable=SC2029
  ssh "$ip" "security unlock-keychain -p '$(pass macbook)' && cd fitbook && git pull && ./scripts/macos.sh"
fi
