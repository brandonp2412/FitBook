#!/bin/sh

set -ex

flutter build ipa
fastlane deliver --ipa build/ios/ipa/fit_book.ipa
