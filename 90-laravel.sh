#!/bin/bash
set -e

# Edit the nginx configuation
php -r "
\$path = '/etc/nginx/servers/default.conf';
\$cfg = file_get_contents(\$path);

// Add the rewrite rule in the 'location /' block
\$pos = strrpos(\$cfg, 'location / {') + 12;
\$cfg = substr(\$cfg, 0, \$pos)
    .'
    # Php rewrite
    try_files \$uri /index.php?\$query_string;
    '
    .substr(\$cfg, \$pos);

// Add 404 redirect before last }
\$pos = strrpos(\$cfg, '}');
\$cfg = substr(\$cfg, 0, \$pos)
    .'
    error_page 404 /index.php;
    '
    .substr(\$cfg, \$pos);

file_put_contents(\$path, \$cfg);"

# Install some php extension
apk add --update php7-tokenizer
apk add --update php7-xml
apk add --update php7-zlib
apk add --update php7-ctype
apk add --update php7-fileinfo
apk add --update php7-sockets
apk add --update php7-dom