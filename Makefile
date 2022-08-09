inception:	
		cd srcs && sudo docker-compose up

all:	Inception

clean:	
	cd srcs && sudo docker-compose down

fclean: clean
	cd srcs ; \
	sudo docker rmi -f srcs_mariadb srcs_wordpress ; \
	sudo docker rm -f mariadb wordpress ; \
	sudo docker volume rm srcs_wordpress-volume srcs_mariadb-volume;

re:	fclean all

.PHONY: Inception all clean fclean re
