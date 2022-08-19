FROM debian:buster
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
	apt-get install -y nginx \
	openssl && \
	echo "daemon off;" >> /etc/nginx/nginx.conf
COPY tools /tools
COPY conf/conf.sh /conf.sh
RUN rm -rf /etc/nginx/sites-enabled/default 
ENTRYPOINT ["/conf.sh"]
