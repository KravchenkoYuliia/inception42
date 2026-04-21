#!/bin/bash
set -e

cd /var/www/html


if [ ! -f wp-load.php ]; then
    wp core download --allow-root
else
    echo "Wordpress files exists already"
fi

if [ ! -f wp-config.php ]; then
    wp config create \
    --dbname="${WP_DB_NAME}" \
    --dbuser="${WP_DB_USER}" \
    --dbpass="${WP_DB_PASSWORD}" \
    --dbhost="${WP_DB_HOST}" \
    --allow-root
else
    echo "wp-config already exists"
fi


until mysqladmin ping -h"${WP_DB_HOST%:*}" -P"${WP_DB_HOST##*:}" -u"${WP_DB_USER}" -p"${WP_DB_PASSWORD}" --silent 2>/dev/null; do
    echo "Waiting for mariadb"
    sleep 2
done
#sleep 10
#until wp db check --allow-root 2>/dev/null; do
#echo "Waiting for mariadb"
#    sleep 2
#done

if ! wp core is-installed --allow-root; then
    echo "Installing Wordpress..."
    wp core install --url="${WP_ADMIN_URL}" \
    --title="${WP_DB_TITLE}" \
    --admin_user="${WP_ADMIN_USER}" \
    --admin_password="${WP_ADMIN_PASSWORD}" \
    --admin_email="${WP_ADMIN_EMAIL}" \
    --allow-root 
else
    echo "Wordpress already installed"
fi

exec php-fpm8.2 -F