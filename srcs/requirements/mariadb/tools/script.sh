#!/bin/bash

mkdir -p /run/mysqld
chown -R mysql:mysql /run/mysqld

mysqld_safe &

until mysqladmin ping --silent 2>/dev/null; do
    sleep 1
done

mysql -e "CREATE DATABASE IF NOT EXISTS \`${MY_DATABASE}\`;"
mysql -e "CREATE USER IF NOT EXISTS '${MY_USER}'@'%' IDENTIFIED BY '${MY_PASSWORD}';"
mysql -e "GRANT ALL PRIVILEGES ON \`${MY_DATABASE}\`.* TO '${MY_USER}'@'%';"
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MY_ROOT_PASSWORD}';"
mysqladmin --password=${MY_ROOT_PASSWORD} shutdown

exec mysqld_safe