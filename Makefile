inception:	
		test -d /home/bdetune/data/www || mkdir -p /home/bdetune/data/www
		sudo chown -R www-data:www-data /home/bdetune/data/www
		test -d /home/bdetune/data/mariadb || mkdir -p /home/bdetune/data/mariadb
		cd srcs && sudo docker-compose up --remove-orphans -d

all:		inception

bonus:
		test -d /home/bdetune/data/www || mkdir -p /home/bdetune/data/www
		sudo chown -R www-data:www-data /home/bdetune/data/www
		test -d /home/bdetune/data/mariadb || mkdir -p /home/bdetune/data/mariadb
		test -d /home/bdetune/data/redis || mkdir -p /home/bdetune/data/redis
		cd srcs && sudo docker-compose -f docker-compose_bonus.yml up -d --remove-orphans

clean:	
		cd srcs && sudo docker-compose -f docker-compose_bonus.yml down

fclean: 	clean
		sudo docker rm -f mariadb wordpress nginx proftpd redis adminer cadvisor flask; \
		sudo docker rmi -f mariadb:inception wordpress:inception nginx:inception proftpd:inception redis:inception adminer:inception cadvisor:inception flask:inception; \
		sudo docker volume rm inception_www-volume inception_mariadb-volume inception_redis-volume; \
		true;

fclean-data: 	fclean
		sudo rm -rf /home/bdetune/data/*; true;

re:		clean
		test -d /home/bdetune/data/www || mkdir -p /home/bdetune/data/www
		sudo chown -R www-data:www-data /home/bdetune/data/www
		test -d /home/bdetune/data/mariadb || mkdir -p /home/bdetune/data/mariadb
		cd srcs && sudo docker-compose up -d --build --remove-orphans
		sudo docker image prune -f

re-data:	fclean-data
		test -d /home/bdetune/data/www || mkdir -p /home/bdetune/data/www
		sudo chown -R www-data:www-data /home/bdetune/data/www
		test -d /home/bdetune/data/mariadb || mkdir -p /home/bdetune/data/mariadb
		cd srcs && sudo docker-compose up -d --build --remove-orphans
		sudo docker image prune -f

re-bonus:	clean
		test -d /home/bdetune/data/www || mkdir -p /home/bdetune/data/www
		sudo chown -R www-data:www-data /home/bdetune/data/www
		test -d /home/bdetune/data/mariadb || mkdir -p /home/bdetune/data/mariadb
		test -d /home/bdetune/data/redis || mkdir -p /home/bdetune/data/redis
		cd srcs && sudo docker-compose -f docker-compose_bonus.yml up -d --build --remove-orphans
		sudo docker image prune -f

re-bonus-data:	fclean-data
		test -d /home/bdetune/data/www || mkdir -p /home/bdetune/data/www
		sudo chown -R www-data:www-data /home/bdetune/data/www
		test -d /home/bdetune/data/mariadb || mkdir -p /home/bdetune/data/mariadb
		test -d /home/bdetune/data/redis || mkdir -p /home/bdetune/data/redis
		cd srcs && sudo docker-compose -f docker-compose_bonus.yml up -d --build --remove-orphans
		sudo docker image prune -f

.PHONY: inception all bonus clean fclean fclean-data re re-data re-bonus re-bonus-data
