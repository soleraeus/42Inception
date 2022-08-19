#! /bin/bash

if [ ! -f "/etc/nginx/sites-available/${WP_URL}" ]
then
openssl req -x509 -newkey rsa:4096 -nodes -keyout /etc/ssl/private/key.pem -out /etc/ssl/certs/cert.crt -sha256 -days 365 -subj "/C=FR/L=Paris/O=Inception/CN=${WP_URL}"
cat << EOF > "/etc/nginx/sites-available/${WP_URL}"
server {
	listen 80;
	listen [::]:80;

	server_name ${WP_URL};

	return 404;
}

server {
	listen 443 ssl;
	listen [::]:443 ssl;

	ssl_certificate /etc/ssl/certs/cert.crt;
	ssl_certificate_key /etc/ssl/private/key.pem;

	ssl_protocols TLSv1.2 TLSv1.3;

	server_name ${WP_URL};

	root /var/html/www/wordpress;
	index index.php index.html index.htm;

	location / {
 	   try_files \$uri \$uri/ /index.php?q=\$uri&\$args;
	}

	# SECURITY : Deny all attempts to access PHP Files in the uploads directory
	location ~* /(?:uploads|files)/.*\.php$ {
 	   deny all;
	}
	# REQUIREMENTS : Enable PHP Support
	location ~ \.php$ {
		# SECURITY : Zero day Exploit Protection
		try_files \$uri =404;
		# ENABLE : Enable PHP, listen fpm sock
		fastcgi_split_path_info ^(.+\.php)(/.+)$;
		fastcgi_pass wordpress:9000;
		fastcgi_index index.php;
		include fastcgi_params;
		fastcgi_param SCRIPT_FILENAME \$document_root\$fastcgi_script_name;
	}
}
EOF

ln -s "/etc/nginx/sites-available/${WP_URL}" "/etc/nginx/sites-enabled/${WP_URL}"

openssl req -x509 -newkey rsa:4096 -nodes -keyout /etc/ssl/private/key-bs.pem -out /etc/ssl/certs/cert-bs.crt -sha256 -days 365 -subj "/C=FR/L=Paris/O=Inception/CN=bullshit.42.fr"
cat << EOF > "/etc/nginx/sites-available/bullshit.42.fr"
server {
	listen 80;
	listen [::]:80;

	server_name bullshit.42.fr;

	return 404;
}

server {
	listen 443 ssl;
	listen [::]:443 ssl;

	ssl_certificate /etc/ssl/certs/cert-bs.crt;
	ssl_certificate_key /etc/ssl/private/key-bs.pem;

	ssl_protocols TLSv1.2 TLSv1.3;

	server_name bullshit.42.fr;

	root /var/html/www/stat;
	index index.php index.html index.htm;
}
EOF

ln -s "/etc/nginx/sites-available/bullshit.42.fr" "/etc/nginx/sites-enabled/bullshit.42.fr"


fi
exec nginx
