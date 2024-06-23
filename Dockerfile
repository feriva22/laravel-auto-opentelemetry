ARG PHP_VERSION=8.1
FROM ghcr.io/open-telemetry/opentelemetry-php/opentelemetry-php-base:${PHP_VERSION}

USER root

RUN install-php-extensions \
        opentelemetry \
        pdo \
        pdo_mysql

COPY . .

ENV COMPOSER_ALLOW_SUPERUSER=1

RUN composer install

USER php