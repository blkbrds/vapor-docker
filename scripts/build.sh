#!/bin/bash

set -e;

dc() {
    docker-compose -f ./docker/docker-compose.yml -f ./docker/docker-compose-pro.yml "$@";
};

dc down;
dc up --build -d cftr-api-dev;
docker attach cftr-api-dev;
dc build cftr-api;
echo 'Done!!!';
