#!/bin/bash

set -e;

# rm -rf .build

dc() {
    docker-compose -f ./docker/docker-compose.yml -f ./docker/docker-compose-pro.yml "$@";
};

dc down;
dc up -d proxy
dc up --build --remove-orphans cftr-api;
