#!/bin/sh
# set -e tells the script to exit if a command fails
set -e

#maybe i need a separate root user?
bootstrap() {
	mariadb-install-db \
		--user=mysql \
		--datadir=/var/lib/mysql \
		--skip-test-db
	exec mariadbd --user=mysql --bootstrap << EOF
FLUSH PRIVILEGES;
CREATE USER ${DB_USER}@'localhost' IDENTIFIED BY '${DB_PASSWORD}';
GRANT ALL ON *.* TO ${DB_USER}@'localhost';
CREATE DATABASE IF NOT EXISTS ${DB_NAME};
FLUSH PRIVILEGES;
EOF
}

if [ ! -d /var/lib/mysql/mysql ]; then
	bootstrap
fi

exec mariadbd --user=mysql
