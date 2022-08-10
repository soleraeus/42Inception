inception:	
		cd srcs && sudo docker-compose up

all:	inception

clean:	
	cd srcs && sudo docker-compose down

fclean: clean
	cd srcs ; \
	sudo docker rmi -f srcs_mariadb srcs_wordpress ; \
	sudo docker rm -f mariadb wordpress ; \
	sudo docker volume rm srcs_wordpress-volume srcs_mariadb-volume; \
	sudo rm -rf /home/bdetune/data/wordpress/* /home/bdetune/data/mariadb/*;

re:	fclean all

.PHONY: inception all clean fclean re
