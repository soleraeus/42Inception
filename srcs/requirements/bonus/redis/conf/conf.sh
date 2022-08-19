#! /bin/bash

chown -R redis:redis /var/lib/redis;
chmod -R 774 /var/lib/redis;
sed -i "s/# requirepass foobared/requirepass ${REDIS_PWD}/" "/etc/redis/redis.conf"
exec redis-server /etc/redis/redis.conf --daemonize no
