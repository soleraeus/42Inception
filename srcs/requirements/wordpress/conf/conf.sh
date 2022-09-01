#! /bin/bash

########### Ensure files necessary to php-fpm are present ############
test -d /run/php || mkdir -p /run/php
test -f /run/php || touch /run/php/php7.4-fpm.pid


########################## Wait for database #########################
until mysql -hmariadb --user="${WP_DB_USER}" --password="${WP_DB_PWD}" "${WP_DB_NAME}" 2> /dev/null; do
	sleep 2
done
echo "Connected to database"

######## Create wordpress website if not on persistent volume ########
test -d /var/html/www/wordpress || mkdir -p /var/html/www/wordpress

if [ ! -f /var/html/www/wordpress/wp-config.php ]
then

cd /var/html/www/wordpress; \
wp core download --allow-root 2> /dev/null; \
wp config create --dbname="${WP_DB_NAME}" --dbuser="${WP_DB_USER}" --dbpass="${WP_DB_PWD}" --dbhost=mariadb --dbprefix=wp_ --allow-root 2> /dev/null; \
wp core install --url="https://${WP_URL}" --title="${WP_TITLE}" --admin_user="${ADMIN_USER}" --admin_password=${ADMIN_PWD} --admin_email="${ADMIN_EMAIL}" --skip-email --allow-root; \
wp user create "${USER_LOGIN}" "${USER_EMAIL}" --user_pass="${USER_PWD}" --role=editor --allow-root; \
sed -i "s/<?php/<?php\ndefine( 'WP_REDIS_CLIENT', 'phpredis' );\ndefine( 'WP_REDIS_HOST', 'redis' );\ndefine( 'WP_REDIS_PORT', 6379 );\ndefine( 'WP_REDIS_PASSWORD', '${REDIS_PWD}' );\ndefine( 'WP_REDIS_DATABASE', 0 );\n/" "wp-config.php"; \

fi

if [ $BONUS ]
then
	cd /var/html/www/wordpress; \
	wp plugin install redis-cache --activate --allow-root 2> /dev/null; \
	wp redis enable --allow-root;
fi

chown -R www-data:www-data /var/html/www/wordpress

####################### Start php-fpm service ########################
exec /usr/sbin/php-fpm7.4 -F
