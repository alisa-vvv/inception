#!/bin/sh
set -e
if [ ! -f /var/www/html/index.php ]; then
	#please fx this omg
	#until mysql -h $DB_HOST -u $DB_USER -p $DB_PASSWORD 2>/dev/null; do
		sleep 5;
	#done
	cd /var/www/html
	wp core download
	wp config create --force \
		--dbname="${DB_NAME}" \
		--dbuser="${DB_USER}" \
		--dbpass="${DB_PASSWORD}" \
		--dbhost="mariadb:3306"
	wp core install \
		--url=localhost \
		--title=alisa-incept \
		--admin_user="${WP_ADMIN}" \
		--admin_password="${WP_ADMIN_PASSWORD}" \
		--admin_email="${WP_ADMIN_EMAIL}"
	wp user create \
		"${WP_USER}" "${WP_USER_EMAIL}" \
		--user_pass="${WP_USER_PASSWORD}"
fi
exec php-fpm84 -F
