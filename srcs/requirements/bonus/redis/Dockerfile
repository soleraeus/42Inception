FROM debian:buster
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
	apt-get install -y procps \
	redis-server && \
	echo "maxmemory 256mb" >> /etc/redis/redis.conf; \ 
	echo "maxmemory-policy allkeys-lru" >> /etc/redis/redis.conf; \
	sed -i "s/appendonly no/appendonly yes/" /etc/redis/redis.conf; \
	sed -i "s/bind 127.0.0.1 ::1/#bind 127.0.0.1 ::1/g" /etc/redis/redis.conf; \
	sed -i "s/protected-mode yes/protected-mode no/g" /etc/redis/redis.conf;
COPY conf/conf.sh /conf.sh
ENTRYPOINT ["/conf.sh"]
