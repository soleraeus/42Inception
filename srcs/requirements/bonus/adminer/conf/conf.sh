#! /bin/bash

test -d /var/html/www/adminer || mkdir -p /var/html/www/adminer
cd /var/html/www/adminer && test -f adminer.php || wget -O adminer.php https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php
cd /var/html/www/adminer; \
	chmod 775 adminer.php; \
	chown www-data:www-data adminer.php
exec /usr/sbin/php-fpm7.4 -F

