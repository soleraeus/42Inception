FROM debian:buster
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
	apt-get install -y nginx \
	openssl && \
	openssl req -x509 -newkey rsa:4096 -nodes -keyout /etc/ssl/private/key.pem -out /etc/ssl/certs/cert.crt -sha256 -days 365 -subj "/C=FR/L=Paris/O=Inception/CN=bdetune.42.fr"
COPY conf/bdetune.42.fr /etc/nginx/sites-available/bdetune.42.fr
RUN rm -rf /etc/nginx/sites-available/default && ln -s /etc/nginx/sites-available/bdetune.42.fr /etc/nginx/sites-enabled/bdetune.42.fr
#COPY conf.sh conf.sh
#ENTRYPOINT ./conf.sh
CMD ["nginx", "-g", "daemon off"]
