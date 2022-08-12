inception:	
		cd srcs && sudo docker-compose up

all:	inception

clean:	
	cd srcs && sudo docker-compose down

fclean: clean
	cd srcs ; \
	sudo docker rm -f mariadb wordpress nginx; \
	sudo docker rmi -f mariadb:inception wordpress:inception nginx:inception; \
	sudo docker volume rm srcs_wordpress-volume srcs_mariadb-volume; \
	sudo rm -rf /home/bdetune/data/wordpress/* /home/bdetune/data/mariadb/*

re:	fclean all

.PHONY: inception all clean fclean re
