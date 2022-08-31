#! /bin/bash

# Generate certificate
openssl req -x509 -newkey rsa:4096 -nodes -keyout /etc/ssl/private/key-cv.pem -out /etc/ssl/certs/cert-cv.crt -sha256 -days 365 -subj "/C=FR/L=Paris/O=${COMPOSE_PROJECT_NAME}/CN=${FLASK_URL}"

# Generate config
cat << EOF > "/etc/nginx/sites-available/${FLASK_URL}"
server {
	listen 80;
	listen [::]:80;

	server_name ${FLASK_URL};

	return 404;
}

server {
	listen 443 ssl;
	listen [::]:443 ssl;

	ssl_certificate /etc/ssl/certs/cert-cv.crt;
	ssl_certificate_key /etc/ssl/private/key-cv.pem;

	ssl_protocols TLSv1.2 TLSv1.3;

	server_name ${FLASK_URL};

	location / {
           include proxy_params;
           proxy_pass http://flask:5000;
           try_files \$uri \$uri/ =404;
	}
}
EOF

# enable website
ln -s "/etc/nginx/sites-available/${FLASK_URL}" "/etc/nginx/sites-enabled/${FLASK_URL}"

exit 0
