#!/bin/bash 

cd /var/www/api.gobouncely.com/bouncely/

git fetch --all
git checkout --force "origin/master"

composer install --no-interaction --prefer-dist --optimize-autoloader

if [ -f artisan ]
then
    php artisan migrate --force
fi