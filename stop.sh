#!/bin/sh

php_version='';

if [[ $1 && $1 == '7.35' ]]; then
    php_version='7.35';
fi

docker compose -f docker-compose$php_version.yml stop