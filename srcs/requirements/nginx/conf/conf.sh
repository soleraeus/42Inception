#! /bin/bash

if [ ! -f "/etc/nginx/sites-available/${WP_URL}" ]
then
	cd /tools; chmod 777 *; for f in *; do bash "$f"; done;
fi
exec nginx
