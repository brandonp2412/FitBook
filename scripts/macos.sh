#!/bin/sh

source "$HOME/.zprofile"
export PATH="/opt/homebrew/lib/ruby/gems/3.4.0/bin:$PATH"
export FLUTTER_ROOT="$HOME/flutter"
export PATH="$FLUTTER_ROOT/bin:$PATH"

set -ex

flutter build ipa
/usr/local/bin/fastlane deliver --ipa build/ios/ipa/fit_book.ipa

flutter build macos --release
APP_NAME="build/macos/Build/Products/Release/FitBook.app"
PACKAGE_NAME=build/macos/FitBook.pkg
xcrun productbuild --component "$APP_NAME" /Applications/ build/macos/unsigned.pkg

INSTALLER_CERT_NAME=$(keychain list-certificates |
  jq '[.[]
            | select(.common_name
            | contains("Mac Developer Installer"))
            | .common_name][0]' |
  xargs)
xcrun productsign --sign "$INSTALLER_CERT_NAME" build/macos/unsigned.pkg "$PACKAGE_NAME"
rm -f build/macos/unsigned.pkg

/usr/local/bin/fastlane deliver --pkg build/macos/FitBook.pkg