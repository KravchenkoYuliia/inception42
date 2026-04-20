## This project represents 3 containers with 
- Nginx server ( accepts HTTP/HTTPs request from browser and transfer PHP files to WordPress )
- WordPress ( run PHP-FPM to give browser files to show it on the site and communicate with data base mariadb )
- Mariadb ( save site's data: comments etc )

## `make` to compile the project = start the containers
open `https://yukravch.42.fr`( same as `localhost`: name can be changed in /etc/hosts )
click to `Hello world` and write a comment
than connect with admin profile to accept this comment by adding `wp-admin` to URL
admin-name and admin-password can be created by adding `.env` file

`.env` file must have following variables:
WP_DB_HOST=mariadb:3306

MY_DATABASE                
MY_PASSWORD
MY_ROOT_PASSWORD
WP_DB_NAME
WP_DB_USER
WP_DB_PASSWORD
WP_ADMIN_URL
WP_DB_TITLE
WP_ADMIN_USER
WP_ADMIN_PASSWOD
WP_ADMIN_EMAIL

All modification on the Wordpress site are saved in volumes

## stop the containers with `make clean`

## delete EVERYTHING with `make fclean`