#!/bin/bash

if [ ! -d "var/lib/mysql/$SQL_DATABASE" ]; then
	echo "Initializing database..."

	mysqld_safe --skip-networking &
    sleep 5

	while ! mysqladmin ping --silent; do
        echo "Waiting for MariaDB to be ready..."
        sleep 1
    done

	mysql -e "CREATE DATABASE IF NOT EXISTS \`$SQL_DATABASE\`;"
	mysql -e "CREATE USER IF NOT EXISTS '$SQL_USER'@'%' IDENTIFIED BY '$SQL_PASSWORD';"
	mysql -e "GRANT ALL PRIVILEGES ON \`$SQL_DATABASE\`.* TO '$SQL_USER'@'%';"
	mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$SQL_ROOT_PASSWORD';"
	mysql -uroot -p"$SQL_ROOT_PASSWORD" -e "FLUSH PRIVILEGES"

	echo "Database initialized successfully" 
else
	echo "Database already initialized"
fi

killall mysqld_safe
sleep 2

exec mysqld