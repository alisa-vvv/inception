#!/bin/sh
echo "hello, mariadb talking"
if [ ! -d /var/lib/mysql/mysql ]; then
	echo "making directory"
	mariadb-isntall-db \
		--user=mysql \
		--datadir=/var/lib/mysql \
		--skip-test-db
fi

echo "execing mariadbd"
exec mariadbd --user=mysql --console
echo "rah?"
