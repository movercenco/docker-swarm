FROM php:7-fpm

RUN apt-get update && apt-get install -y vim unzip \
    && docker-php-ext-install pdo pdo_mysql \
    && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

COPY ./app /src

RUN chown -R www-data:www-data /src \
  && cd /src \
  && composer install --no-interaction
