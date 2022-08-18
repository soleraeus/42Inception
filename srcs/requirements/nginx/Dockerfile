FROM debian:buster
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
	apt-get install -y nginx \
	openssl && \
	openssl req -x509 -newkey rsa:4096 -nodes -keyout /etc/ssl/private/key.pem -out /etc/ssl/certs/cert.crt -sha256 -days 365 -subj "/C=FR/L=Paris/O=Inception/CN=bdetune.42.fr" ; \
	echo "daemon off;" >> /etc/nginx/nginx.conf
COPY conf/conf.sh /conf.sh
RUN rm -rf /etc/nginx/sites-enabled/default 
ENTRYPOINT ["/conf.sh"]
