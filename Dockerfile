# PHP 7 docker environement with alpine, nginx, php7 for Laravel
FROM hellifiknow/nginx-php7:onbuild

# Args changes
ARG STATIC_DIR=public

# Install
COPY ??-*.sh /install/
RUN /bin/sh /install/install.sh