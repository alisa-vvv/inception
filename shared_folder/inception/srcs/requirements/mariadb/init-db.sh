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
CREATE USER ${DB_USER}@'%' IDENTIFIED BY '${DB_PASSWORD}';
GRANT ALL ON *.* TO ${DB_USER}@'%' WITH GRANT OPTION;
CREATE DATABASE ${DB_NAME};
USE ${DB_NAME};
FLUSH PRIVILEGES;
EOF
chown mysql:mysql /var/run/mysqld
chmod 755 /var/run/mysqld
}

if [ ! -d /var/lib/mysql/mysql ]; then
	bootstrap
fi

exec mariadbd --user=mysql
