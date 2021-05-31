#!/bin/sh

php_version='';

if [[ $1 ]]; then
    php_version=$1;
fi

docker compose -f docker-compose$php_version.yml down