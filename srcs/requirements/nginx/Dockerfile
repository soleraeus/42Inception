FROM debian:buster
ARG DEBIAN_FRONTEND=noninteractive
RUN printf '#! /bin/sh\nexit 0' > /usr/sbin/policy-rc.d; \
	echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections; \
	apt-get update && \
	apt-get install --no-install-recommends --no-install-suggests -y nginx \
	openssl && \
	echo "daemon off;" >> /etc/nginx/nginx.conf
COPY tools /tools
COPY conf/conf.sh /conf.sh
RUN rm -rf /etc/nginx/sites-enabled/default; \
	chmod 0777 /conf.sh;
ENTRYPOINT ["/conf.sh"]
