FROM debian:buster
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
	apt-get install -y proftpd \
	openssl && \
	openssl req -x509 -newkey rsa:4096 -nodes -keyout /etc/ssl/private/key.pem -out /etc/ssl/certs/cert.crt -sha256 -days 365 -subj "/C=FR/L=Paris/O=Inception/CN=ftp.bdetune.42.fr" &&\
	test /wordpress || mkdir /wordpress &&\
	echo "/bin/false" >> /etc/shells
COPY conf/conf.sh /conf.sh
ENTRYPOINT ["/conf.sh"]
