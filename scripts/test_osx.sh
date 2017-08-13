#!/bin/bash

set -eo pipefail;

if [[ "$(uname)" != 'Darwin' ]]; then exit 0; fi;

APP='CFTR-Api';

if ! [[ -d "./$APP.xcodeproj" ]]; then
    swift package generate-xcodeproj;
fi;

rm -rf .build/*debug*;
rm -rf .build/*release*;
rm -rf .build/*build*;

swift package fetch;

xcodebuild build test \
    -project "$APP.xcodeproj" \
    -scheme "$APP" \
    -configuration release \
    -enableCodeCoverage YES | bundle exec xcpretty;

exit "${PIPESTATUS[0]}"
