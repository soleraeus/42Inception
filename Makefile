inception:	
		cd srcs && sudo docker-compose up

all:	inception

clean:	
	cd srcs && sudo docker-compose down

fclean: clean
	cd srcs ; \
	sudo docker rm -f mariadb wordpress nginx proftpd; \
	sudo docker rmi -f mariadb:inception wordpress:inception nginx:inception proftpd:inception; \
	sudo docker volume rm srcs_wordpress-volume srcs_mariadb-volume; \
	true;

fclean-deep: fclean
		sudo rm -rf /home/bdetune/data/wordpress/* /home/bdetune/data/mariadb/*; true;

re:	fclean all

re-deep:	fclean-deep all

.PHONY: inception all clean fclean fclean-deep re re-deep
