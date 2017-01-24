#!/bin/sh

apt-get update && apt-get install -y vim unzip

apt-get install php7-mysql

apt-get install pdo-mysql

curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

chown -R www-data:www-data /src && cd /src && composer install --no-interaction

