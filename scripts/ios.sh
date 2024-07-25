#!/bin/sh

set -ex

flutter build ipa
fastlane deliver --silent --ipa build/ios/ipa/fit_book.ipa
