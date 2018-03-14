#!/bin/bash
set -e

# Install some php extension
apk add --update php7-tokenizer
apk add --update php7-xml
apk add --update php7-zlib
apk add --update php7-ctype
apk add --update php7-fileinfo
apk add --update php7-sockets
apk add --update php7-dom

# Add the rewrite rules
echo '
location / {
	try_files $uri /index.php?$query_string;
}
error_page 404 /index.php;
' > /etc/nginx/locations/90-laravel.conf