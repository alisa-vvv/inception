DATA_DIR_WP = /home/avaliull/data/wordpress
DATA_DIR_MARIADB = /home/avaliull/data/mariadb

all: up

up:
	mkdir -p $(DATA_DIR_WP) $(DATA_DIR_MARIADB)
	docker compose --project-directory srcs up -d
down:
	docker compose --project-directory srcs down
reset:
	$(MAKE) down
	docker stop $$(docker ps -qa); \
	docker rm $$(docker ps -qa); \
	docker rmi -f $$(docker images -qa); \
	docker volume rm $$(docker volume ls -q); \
	docker network rm $$(docker network ls -q) 2>/dev/null

clean-data:
	rm -rf $(DATA_DIR_WP) $(DATA_DIR_MARIADB)

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
