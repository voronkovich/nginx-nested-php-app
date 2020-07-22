FROM php:7.4-fpm-alpine

ARG PHP_FPM_USER=1000
ARG PHP_FPM_GROUP=${PHP_FPM_USER}

RUN sed -i -E \
    -e "s/^(user\s*=\s*).*/\1${PHP_FPM_USER}/" \
    -e "s/^(group\s*=\s*).*/\1${PHP_FPM_GROUP}/" \
    /usr/local/etc/php-fpm.d/www.conf
