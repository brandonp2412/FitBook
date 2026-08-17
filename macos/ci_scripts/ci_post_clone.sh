#!/bin/sh

set -e

cd $CI_PRIMARY_REPOSITORY_PATH
export PATH="$PATH:$(pwd)/flutter/bin"

HOMEBREW_NO_AUTO_UPDATE=1
brew install cocoapods

flutter precache --macos
flutter/bin/flutter pub get --enforce-lockfile
flutter build macos

cd macos && pod install

exit 0
