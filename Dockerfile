# PHP 7 docker environement with alpine, nginx, php7 for Laravel
FROM blunt1337/nginx-php7:onbuild
MAINTAINER Olivier Blunt <contact@blunt.sh>

# Args changes
ARG STATIC_DIR=public

# Setup
COPY ??-*.sh /setup/
RUN /bin/sh /setup/setup.sh