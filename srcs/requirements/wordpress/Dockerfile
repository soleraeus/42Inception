FROM debian:buster
RUN apt-get update && \
	apt-get install -y curl && \
	apt-get install -y php-fpm && \
WORKDIR	/wp
RUN	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
	chmod +x wp-cli.phar && \
	mv wp-cli.phar /usr/local/bin/wp && \
	wp core is-installed --allow-root 
#|| \
#	wp core download --allow-root && \
#	wp config create --allow-root && \
#	wp core install --allow-root
CMD php-fpm -F
