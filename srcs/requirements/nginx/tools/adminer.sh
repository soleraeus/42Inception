#! /bin/bash

# Generate certificate
openssl req -x509 -newkey rsa:4096 -nodes -keyout /etc/ssl/private/key-adminer.pem -out /etc/ssl/certs/cert-adminer.crt -sha256 -days 365 -subj "/C=FR/L=Paris/O=${COMPOSE_PROJECT_NAME}/CN=${ADMINER_URL}"

# Generate config
cat << EOF > "/etc/nginx/sites-available/${ADMINER_URL}"
server {
	listen 80;
	listen [::]:80;

	server_name ${ADMINER_URL};

	return 404;
}

server {
	listen 443 ssl;
	listen [::]:443 ssl;

	ssl_certificate /etc/ssl/certs/cert-adminer.crt;
	ssl_certificate_key /etc/ssl/private/key-adminer.pem;

	ssl_protocols TLSv1.2 TLSv1.3;

	server_name ${ADMINER_URL};

	root /var/html/www/adminer/;
	index adminer.php;

	location / {
           try_files \$uri \$uri/ =404;
	}
	
	# REQUIREMENTS : Enable PHP Support
	location ~ \.php$ {
		# SECURITY : Zero day Exploit Protection
		try_files \$uri =404;
		# ENABLE : Enable PHP, listen fpm sock
		fastcgi_split_path_info ^(.+\.php)(/.+)$;
		fastcgi_pass adminer:9000;
		fastcgi_index index.php;
		include fastcgi_params;
		fastcgi_param SCRIPT_FILENAME \$document_root\$fastcgi_script_name;
	}
}
EOF

# enable website
ln -s "/etc/nginx/sites-available/${ADMINER_URL}" "/etc/nginx/sites-enabled/${ADMINER_URL}"

exit 0
