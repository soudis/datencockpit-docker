FROM php:apache

ARG DATENCOCKPIT_SITENAME
ARG DATENCOCKPIT_URL
ARG DATENCOCKPIT_EMERGENCY_CONTACT
ARG DATENCOCKPIT_DB_HOST
ARG DATENCOCKPIT_DB_NAME
ARG DATENCOCKPIT_DB_USERNAME
ARG DATENCOCKPIT_DB_PASSWORD
ARG HABIDAT_USER_NEXTCLOUD_DB_PASSWORD

WORKDIR /var/www/html

RUN wget http://www.datencockpit.at/release/datencockpitV0-2.tar.gz && tar -xzvf datencockpitV0-2.tar.gz

ADD LocalSettings.php.template

RUN \
  apt-get update \
  && apt-get -y install gettext-base \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

RUN envsubst < LocalSettings.php.template > LocalSettings.php

