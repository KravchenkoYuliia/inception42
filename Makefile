up:

	mkdir -p /home/yukravch/data/wordpress
	mkdir -p /home/yukravch/data/database

	docker compose -f ./srcs/docker-compose.yml up --build


clean:
	docker compose -f ./srcs/docker-compose.yml down -v
fclean:
	docker compose -f ./srcs/docker-compose.yml down -v
	docker container prune -f
	docker volume prune -f
	docker rmi nginx:latest wordpress:latest mariadb:latest
	sudo rm -rf /home/yukravch/data
	docker system prune