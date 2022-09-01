FROM debian:buster
ARG DEBIAN_FRONTEND=noninteractive
RUN printf '#! /bin/sh\nexit 0' > /usr/sbin/policy-rc.d; \
	echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections; \
	apt-get update && \
	apt-get install --no-install-recommends --no-install-suggests -y redis-server && \
	echo "maxmemory 256mb" >> /etc/redis/redis.conf; \ 
	echo "maxmemory-policy allkeys-lru" >> /etc/redis/redis.conf; \
	sed -i "s/appendonly no/appendonly yes/" /etc/redis/redis.conf; \
	sed -i "s/bind 127.0.0.1 ::1/#bind 127.0.0.1 ::1/g" /etc/redis/redis.conf; \
	sed -i "s/dir .\//dir \/var\/lib\/redis/g" /etc/redis/redis.conf; \
	test -d /var/lib/redis || mkdir /var/lib/redis;
COPY conf/conf.sh /conf.sh
RUN chmod 0777 /conf.sh
ENTRYPOINT ["/conf.sh"]
