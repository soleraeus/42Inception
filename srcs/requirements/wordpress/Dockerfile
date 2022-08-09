FROM debian:buster
RUN apt-get update && \
	apt-get install -y curl && \
	apt-get install -y mariadb-client && \
	apt-get install -y php-fpm && \
	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
	chmod +x wp-cli.phar && \
	mv wp-cli.phar /usr/local/bin/wp
COPY conf.sh conf.sh
#ENTRYPOINT ./conf.sh
CMD sleep infinity
