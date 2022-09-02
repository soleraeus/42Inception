inception:	
		test -d /home/betune/data/www || mkdir -p /home/bdetune/data/www
		sudo chown -R www-data:www-data /home/bdetune/data/www
		test -d /home/betune/data/mariadb || mkdir -p /home/bdetune/data/mariadb
		cd srcs && sudo docker-compose up -d

all:	inception

bonus:
		test -d /home/betune/data/www || mkdir -p /home/bdetune/data/www
		sudo chown -R www-data:www-data /home/bdetune/data/www
		test -d /home/betune/data/mariadb || mkdir -p /home/bdetune/data/mariadb
		test -d /home/betune/data/redis || mkdir -p /home/bdetune/data/redis
		cd srcs && sudo docker-compose -f docker-compose_bonus.yml up

clean:	
	cd srcs && sudo docker-compose -f docker-compose_bonus.yml down

fclean: clean
	sudo docker rm -f mariadb wordpress nginx proftpd redis adminer cadvisor flask; \
	sudo docker rmi -f mariadb:inception wordpress:inception nginx:inception proftpd:inception redis:inception adminer:inception cadvisor:inception flask:inception; \
	sudo docker volume rm inception_www-volume inception_mariadb-volume inception_redis-volume; \
	true;

fclean-deep: fclean
		sudo rm -rf /home/bdetune/data/*; true;

re:	clean
	test -d /home/betune/data/www || mkdir -p /home/bdetune/data/www
	test -d /home/betune/data/mariadb || mkdir -p /home/bdetune/data/mariadb
	cd srcs && sudo docker-compose up -d --build

re-bonus:	clean
		test -d /home/betune/data/www || mkdir -p /home/bdetune/data/www
		test -d /home/betune/data/mariadb || mkdir -p /home/bdetune/data/mariadb
		test -d /home/betune/data/redis || mkdir -p /home/bdetune/data/redis
		cd srcs && sudo docker-compose -f docker-compose_bonus.yml up --build

re-deep:	fclean-deep all

re-deep-bonus:	fclean-deep bonus

.PHONY: inception all clean fclean fclean-deep re re-deep
