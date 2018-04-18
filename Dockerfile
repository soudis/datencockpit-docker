FROM php:5-apache

ARG DATENCOCKPIT_SITENAME
ARG DATENCOCKPIT_URL
ARG DATENCOCKPIT_EMERGENCY_CONTACT
ARG DATENCOCKPIT_DB_HOST
ARG DATENCOCKPIT_DB_NAME
ARG DATENCOCKPIT_DB_USER
ARG DATENCOCKPIT_DB_PASSWORD

RUN docker-php-ext-install mysqli 

RUN apt-get update && apt-get install -y \
    libmagickwand-dev --no-install-recommends \
    && pecl install imagick \
	&& docker-php-ext-enable imagick

RUN apt-get -y install gettext-base wget \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

WORKDIR /var/www/html

USER www-data:www-data

RUN wget http://www.datencockpit.at/release/datencockpitV0-2.tar.gz && tar -xzvf datencockpitV0-2.tar.gz --strip-components=1

ADD LocalSettings.php.template /var/www/html

RUN envsubst '$DATENCOCKPIT_SITENAME $DATENCOCKPIT_URL $DATENCOCKPIT_EMERGENCY_CONTACT $DATENCOCKPIT_DB_HOST $DATENCOCKPIT_DB_NAME $DATENCOCKPIT_DB_USER $DATENCOCKPIT_DB_PASSWORD $HABIDAT_USER_NEXTCLOUD_DB_PASSWORD' < LocalSettings.php.template > LocalSettings.php 

ADD update.sh /var/www/html

USER root
