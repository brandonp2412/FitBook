#!/bin/sh

set -e

cd $CI_PRIMARY_REPOSITORY_PATH
export PATH="$PATH:$(pwd)/flutter/bin"

flutter precache --ios
flutter pub get

HOMEBREW_NO_AUTO_UPDATE=1
brew install cocoapods
cd ios && pod install

exit 0
