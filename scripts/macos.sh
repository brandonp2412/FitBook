#!/bin/sh

source "$HOME/.zprofile"
export PATH="/opt/homebrew/lib/ruby/gems/3.4.0/bin:$PATH"
export FLUTTER_ROOT="$HOME/flutter"
export PATH="$FLUTTER_ROOT/bin:$PATH"

set -ex

####
# iOS deployment 🍏
####
flutter build ipa
/usr/local/bin/fastlane deliver --ipa build/ios/ipa/fit_book.ipa

###
# MacOS deployment 😬
###
flutter build macos --release
fastlane cert --platform macos --type mac_installer_distribution --user "$APPLE_EMAIL"
APP_NAME="build/macos/Build/Products/Release/FitBook.app"
PACKAGE_NAME=build/macos/FitBook.pkg
xcrun productbuild --component "$APP_NAME" /Applications/ build/macos/unsigned.pkg
INSTALLER_CERT_NAME=$(security find-certificate -c "Mac Developer Installer" -a | grep "alis" | head -n 1 | cut -d '"' -f 4)
xcrun productsign --sign "$INSTALLER_CERT_NAME" build/macos/unsigned.pkg "$PACKAGE_NAME"
rm -f build/macos/unsigned.pkg
fastlane deliver --pkg build/macos/FitBook.pkg --platform osx
