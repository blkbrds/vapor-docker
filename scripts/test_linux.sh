#!/bin/bash

set -e

if [[ "$CI" == 'true' && "$(uname)" == 'Darwin' ]]; then
    exit 0;
fi;

rm -rf ./.build/*debug*;
rm -rf ./.build/*release*;
rm -rf ./.build/*build*;

dc() {
    docker-compose -f ./docker/docker-compose.yml -f ./docker/docker-compose-test.yml "$@";
};

dc down;
dc up -d --build --remove-orphans cftr-api-dev;
docker attach cftr-api-dev;
RET="$(docker wait cftr-api-dev)";
dc logs;
dc down;

exit "$RET";
