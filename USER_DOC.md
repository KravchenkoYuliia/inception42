##  What services are provided by the stack
This project represents 3 containers with 
- Nginx server ( accepts HTTP/HTTPs request from browser and transfer PHP files to WordPress )
- WordPress ( run PHP-FPM to give browser files to show it on the site and communicate with data base mariadb )
- Mariadb ( save site's data: comments etc )

## Start and stop the project
- `make up` to compile the project = create volumes and start the containers with `docker compose up`
- `make down` stops the containers with `docker compose down`
- `make clean` stops the containers and remove the volumes
- `make fclean` delete EVERYTHING

## Access the website and the administration panel

- open `https://yukravch.42.fr`( same as `localhost`: name can be changed in /etc/hosts )
- click to `Hello world` and write a comment
- than connect with admin profile to accept this comment by adding `wp-admin` to URL
- admin-name and admin-password can be created by adding `.env` file

All modification on the Wordpress site are saved in volumes

## Locate and manage credentials

Data for configuration WordPress and Mariadb database(user name, admin name, passwords ...) must be in .env -> you have to create this file in directory srcs

`.env` file must have following variables:
WP_DB_HOST=mariadb:3306

MY_DATABASE=your_value                
MY_PASSWORD=your_value 
MY_ROOT_PASSWORD=your_value 
WP_DB_NAME=your_value 
WP_DB_USER=your_value 
WP_DB_PASSWORD=your_value 
WP_ADMIN_URL=your_value 
WP_DB_TITLE=your_value 
WP_ADMIN_USER=your_value
WP_ADMIN_PASSWORD=your_value 
WP_ADMIN_EMAIL=your_value 

## Check that the services are running correctly
- `docker ps` shows all running containers
    you must see `nginx`, `mariadb`, `wordpress`

- `https:://yukravch.42.fr` is accessible