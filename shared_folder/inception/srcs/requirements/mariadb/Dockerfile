FROM alpine:3.23.6
RUN apk add --no-cache mariadb mariadb-client
# directory for runtime files
RUN mkdir -p /run/mysqld
# directory for the databases
RUN mkdir -p /var/lib/mysql
# making these directories avalilable for mysql user and group
RUN chown -R mysql:mysql /run/mysqld /var/lib/mysql
COPY init-db.sh /usr/local/bin/init-db.sh
RUN chmod +x /usr/local/bin/init-db.sh
COPY mariadb.cnf /etc/my.cnf.d/mariadb-server.cnf

# not sure if this is the correct way, CHECK
EXPOSE 3306

CMD [ "/usr/local/bin/init-db.sh" ]
