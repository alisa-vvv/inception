all: up

up:
	docker compose --project-directory srcs up -d
down:
	docker compose --project-directory srcs down
clean:
	docker stop $$(docker ps -qa); \
	docker rm $$(docker ps -qa); \
	docker rmi -f $$(docker images -qa); \
	docker volume rm $$(docker volume ls -q); \
	docker network rm $$(docker network ls -q) 2>/dev/null
re:
	$(MAKE) up
	$(MAKE) down

logs-all:
	docker compose --project-directory srcs logs -f

logs-mariadb:
	docker compose --project-directory srcs logs -f mariadb

logs-nginx:
	docker compose --project-directory srcs logs -f nginx

logs-wordpress:
	docker compose --project-directory srcs logs -f wordpress
