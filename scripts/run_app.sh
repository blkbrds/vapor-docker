#!/bin/bash

set -e;

# rm -rf .build

dc() {
    docker-compose -f ./docker/docker-compose.yml -f ./docker/docker-compose-dev.yml "$@";
};

dc down;
dc up -d proxy
dc up --build --remove-orphans cftr-api-dev;
