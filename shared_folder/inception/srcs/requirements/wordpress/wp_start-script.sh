#!/bin/sh
set -e
if [ ! -f /var/www/html/index.php ]; then
	#please fx this omg
	waited_for=0
	echo "waiting for mariadb..."
	until /usr/bin/mariadb-admin -h ${DB_HOST} -u ${DB_USER} -p${DB_PASSWORD} ping; do
        	sleep 2
		waited_for=$((waited_for+2))
		echo "waited for $waited_for seconds..."
    	done
	#until mysql -h $DB_HOST -u $DB_USER -p $DB_PASSWORD 2>/dev/null; do
	#	sleep 5;
	#done
	echo "...done waiting for mariadb"
	cd /var/www/html
	wp core download
	wp config create --force \
		--dbname="${DB_NAME}" \
		--dbuser="${DB_USER}" \
		--dbpass="${DB_PASSWORD}" \
		--dbhost="mariadb" \
		--extra-php <<PHP
define('WP_HOME', 'https://avaliull.42.fr');
define('WP_SITEURL', 'https://avaliull.42.fr');
PHP
	wp core install \
		--url=localhost \
		--title=alisa-incept \
		--admin_user="${WP_ADMIN}" \
		--admin_password="${WP_ADMIN_PASSWORD}" \
		--admin_email="${WP_ADMIN_EMAIL}"
	wp user create \
		"${WP_USER}" "${WP_USER_EMAIL}" \
		--user_pass="${WP_USER_PASSWORD}"
	sed -i 's/^listen = 127\.0\.0\.1:9000/listen = 9000/' /etc/php84/php-fpm.d/www.conf
fi
exec php-fpm84 -F
