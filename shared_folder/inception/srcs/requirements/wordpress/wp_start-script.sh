#!/bin/sh
if [ ! -f /var/www/html/index.php ]; then
	wp core download --path=/var/www/html
	wp config create \
		--dbname=$(DB_NAME) \
		--dbuser=$(WP_ADMIN) \
		--dbpass=$(WP_ADMIN_PASSWORD) \
		--dbhost="mariadb:3306"
	wp core install \
		url=localhost \
		title=alisa-incept \
		--admin_user="$(WP_ADMIN)" \
		--admin_password="$(WP_ADMIN_PASSWORD)" \
		--admin_email="$(WP_ADMIN_MAIL)"
	wp user create \
		$(WP_USER) $(WP_USER_EMAIL) \
		--user_pass="$(WP_USER_PASSWORD)"
fi
exec php-fpm84

