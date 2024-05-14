#!/bin/bash

set -ex

./screenshots.sh "phoneScreenshots"
./screenshots.sh "sevenInchScreenshots"
./screenshots.sh "tenInchScreenshots"

line=$(yq -r .version pubspec.yaml)
build_number=$(cut -d '+' -f 2 <<< "$line")
version=$(cut -d '+' -f 1 <<< "$line")
major=$(cut -d '.' -f 1 <<< "$version")
minor=$(cut -d '.' -f 2 <<< "$version")
patch=$(cut -d '.' -f 3 <<< "$version")
new_patch=$((patch + 1))
new_build_number=$((build_number + 1))

new_flutter_version="$major.$minor.$new_patch+$new_build_number"
new_version="$major.$minor.$new_patch"
yq -yi ".version |= \"$new_flutter_version\"" pubspec.yaml
rest=$(git log -1 --pretty=%B | tail -n +2)
git add pubspec.yaml
last_commits=$(git log --pretty=format:"%s" @{u}..HEAD | awk '{print "- "$0}')
changelog="$1"
echo "${changelog:-$last_commits}" > "fastlane/metadata/android/en-US/changelogs/$new_build_number.txt"
git add fastlane/metadata

if [[ -n "$(git ls-files --others --exclude-standard)" ]]; then
    echo "There are unstaged changes in the repository:"
    git --no-pager diff
    git restore --staged pubspec.yaml fastlane/metadata
    git restore pubspec.yaml fastlane/metadata
    rm "fastlane/metadata/android/en-US/changelogs/$new_build_number.txt"
    exit 1
fi

./flutter/bin/flutter build apk --split-per-abi
./flutter/bin/flutter build appbundle

last_commit=$(git log -1 --pretty=%B | head -n 1)
git commit --amend -m "$last_commit - $new_version 🚀 
$rest"
git push

gh release create "$new_version" --notes "${changelog:-$last_commits}"  \
  build/app/outputs/flutter-apk/app-*-release.apk
git pull

fastlane supply --aab build/app/outputs/bundle/release/app-release.aab
echo q | flutter run --release -d 'pixel 5'
