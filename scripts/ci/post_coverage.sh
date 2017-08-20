#!/bin/bash

set -eo pipefail;

if [[ "$(uname)" != 'Darwin' ]]; then exit 0; fi

APP='CFTR-Api';
COV='reports';

bundle exec slather coverage \
    --scheme "$APP" \
    --input-format profdata \
    --binary-basename App \
    --output-directory "$COV" \
    --source-directory Sources/App \
    --cobertura-xml \
    "$APP.xcodeproj";

bash <(curl -s https://codecov.io/bash) -J "$APP" -f "$COV/cobertura.xml" -X coveragepy -X gcov -X xcode

# rm -rf ./*coverage*
