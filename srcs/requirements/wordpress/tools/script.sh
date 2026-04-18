#!/bin/bash
set -e

cd /var/www/html

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar

if [ ! -f wp-load.php ]; then
    ./wp-cli.phar core download --allow-root
else
    echo "Wordpress files exists already"
fi

if [ ! -f wp-config.php ]; then
    ./wp-cli.phar config create --dbname=wordpress --dbuser=wpuser --dbpass=password --dbhost=mariadb --allow-root
else
    echo "wp-config already exists"
fi

until ./wp-cli.phar db check --allow-root > /dev/null 2>&1; do
    sleep 2
done

if ! ./wp-cli.phar core is-installed --allow-root; then
    ./wp-cli.phar core install --url=http://localhost:8080 --title=inception --admin_user=admin --admin_password=admin --admin_email=admin@admin.com --allow-root
else
    echo "Wordpress already installed"
fi

exec php-fpm8.2 -F