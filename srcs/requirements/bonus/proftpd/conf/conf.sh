#! /bin/bash

until test -f /wordpress/wordpress/wp-config.php; do
	sleep 1
done

if [ ! -f /etc/ssl/private/proftpd.key ]
then
openssl req -x509 -newkey rsa:4096 -nodes -keyout /etc/ssl/private/proftpd.key -out /etc/ssl/certs/proftpd.crt -sha256 -days 365 -subj "/C=FR/L=Paris/O=${COMPOSE_PROJECT_NAME}/CN=ftp.${WP_URL}"
echo "${FTP_PWD}" | ftpasswd --stdin --passwd --file /etc/proftpd/ftpd.passwd --gid 33 --uid 33 --shell /bin/false --name "${FTP_USER}" --home /wordpress/wordpress
ftpasswd --group --name="${FTP_USER}" --file=/etc/proftpd/ftpd.group --gid=33 --member "${FTP_USER}"
sed -i "s/proftpduser/${FTP_USER}/g" "/etc/proftpd/proftpd.conf"
sed -i "s/proftpduser/${FTP_USER}/g" "/etc/proftpd/conf.d/Inception.conf"

sed -i "s/proftpdgroup/www-data/g" "/etc/proftpd/proftpd.conf"
sed -i "s/proftpdgroup/www-data/g" "/etc/proftpd/conf.d/Inception.conf"	
fi

exec proftpd -n -q
