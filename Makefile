inception:	
		test -d /home/betune/data/wordpress || mkdir -p /home/bdetune/data/wordpress
		test -d /home/betune/data/mariadb || mkdir -p /home/bdetune/data/mariadb
		cd srcs && sudo docker-compose up -d

all:	inception

bonus:
		test -d /home/betune/data/wordpress || mkdir -p /home/bdetune/data/wordpress
		test -d /home/betune/data/mariadb || mkdir -p /home/bdetune/data/mariadb
		test -d /home/betune/data/redis || mkdir -p /home/bdetune/data/redis
		cd srcs && sudo docker-compose -f docker-compose_bonus.yml up -d

clean:	
	cd srcs && sudo docker-compose -f docker-compose_bonus.yml down

fclean: clean
	sudo docker rm -f mariadb wordpress nginx proftpd redis adminer cadvisor flask; \
	sudo docker rmi -f mariadb:inception wordpress:inception nginx:inception proftpd:inception redis:inception adminer:inception cadvisor:inception flask:inception; \
	sudo docker volume rm inception_wordpress-volume inception_mariadb-volume inception_redis-volume; \
	true;

fclean-deep: fclean
		sudo rm -rf /home/bdetune/data/*; true;

re:	fclean all

re-deep:	fclean-deep all

.PHONY: inception all clean fclean fclean-deep re re-deep
