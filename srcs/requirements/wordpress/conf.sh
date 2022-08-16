#! /bin/bash

until mysql -hmariadb --user="${WP_DB_USER}" --password="${WP_DB_PWD}" "${WP_DB_NAME}" 2> /dev/null; do
	sleep 2
done
echo "Connected to database"
test -d /run/php || mkdir -p /run/php
test -f /run/php || touch /run/php/php7.4-fpm.pid
cd /var/html/www; wp core download --allow-root 2> /dev/null; wp config create --dbname="${WP_DB_NAME}" --dbuser="${WP_DB_USER}" --dbpass="${WP_DB_PWD}" --dbhost=mariadb --dbprefix=wp_ --allow-root 2> /dev/null; wp core install --url="${WP_URL}" --title="${WP_TITLE}" --admin_user="${ADMIN_USER}" --admin_password=${ADMIN_PWD} --admin_email="${ADMIN_EMAIL}" --skip-email --allow-root
exec /usr/sbin/php-fpm7.4 -F
