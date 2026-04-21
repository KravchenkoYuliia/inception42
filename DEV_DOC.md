## Set up the environment from scratch (prerequisites, configuration files, secrets)
- install Docker, docker compose
- check if you have `sudo` rights
- change my login in url `yukravch` to yours or `localhost`
- change path to volumes in Makefile
- create `.env` in srcs with following variables
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

## Build and launch the project using the Makefile and Docker Compose

The project is managed by makefile:
- `make up` to compile the project = create volumes and start the containers with `docker compose up`
- `make down` stops the containers with `docker compose down`
- `make clean` stops the containers with `docker compose down` and remove the volumes
- `make fclean` stops the containers with `docker compose down` and delete EVERYTHING

## Use relevant commands to manage the containers and volumes

`docker compose up` - starts the services
`docker compose down` - stops the services and delete the containers
`docker compose ps` - checks the status of containers
`docker compose logs` - shows debugging logs
`docker volume ls` - shows volumes
`docker volume rm <name>` - delete volume 
`docker images` - shows images

`docker rmi image` - delete image
`docker rmi -f $(docker images -aq)` - delete all images
`docker rm containerName` - delete container
`docker container prune` - delete all container

check mariadb database:
`mariadb -u root -p`
`SHOW DATABASES;`
`USE db_name;`
`SHOW TABLES;`
`SELECT * FROM wp_comments;`

manage the docker without docker-compose( example nginx ):
`docker build -t nginx .` - build an image in layers and save the result in Docker engine
`docker run -p 80:80 nginx` - run the container
`docker exec -it nginx bash` - open bash in this container



## Commands in Dockerfile
	- `FROM` defines the sources from which your image will be created
	- `MAINTAINER` defines the image's author and is written like this `Name <email>` (outdated)
		better use
		- LABEL maintainer=name adds any meta data
		
	- `RUN` executes an image but also creates an intermediate image
	- `ADD` allows to copy a file from the host machine or from a URL
	- `EXPOSE` expose a container port to the outside world
	- `CMD` determines the command that will be executed when the container starts
	- `ENTRYPOINT` adds a command that will be executed by default, even if you choose to run a different command than the standard one
	- `WORKDIR` defines the working directory for all other commands (like RUN, CMD, ENTRYPOINT and ADD)
	- `ENV` defines environment variables that can then be modified using the run command parameter `--env<key>=<value>`
	- `VOLUMES` creates a mount point for persisting data. You can then choose to mount this volume in a specific directory using the command `run -v <host path>`

## CMDs


### build an image


### to see which images are created
`sudo docker images`
### run a docker
`docker run -p 80:80 myimage`
### to see dockers
`docker ps`
### enter the docker 
`docker exec -it mycontainer sh`
### open web page to see any simple text from nginx.conf
`https://localhost`

### rm images


### removes stopped containers
`docker rm containerName`
`docker container prune`

### build and run docker compose / delete containers
`docker compose up` /
`docker compose down`


### get my IP
`hostname -I | awk '{print $1}'`



### Ports
Browser hhtps ---> 443 ---> nginx ---> 9000 ---> wordpress (php-fpm) ---> 3306 ---> mariadb


### Volumes
- MariaDB `/var/lib/mysql`
- WordPress `/var/www/html`


## Testing real containers
### mariadb
`docker pull mariadb`
optionnal to see exposed port: `docker inspect mariadb:latest`
`docker run -e MARIADB_ROOT_PASSWORD=1 mariadb:latest`
`docker exec -it <container_number>`
`mariadb` - enters MariaDB monitor
`mariadb -u root -p` enters MariaDB monitor with password
`SHOW DATABASES;`
show user
`SELECT User, Host FROM mysql.user;`


### my docker mariadb

`mariadb -u root -p`
`SHOW DATABASES;`
`USE db_name;`
`SHOW TABLES;`
`SELECT * FROM wp_comments;`

### test real wordpress
create network connection for future container
```podman network create wp-net```

    run mariadb
```
podman run -d \
  --name db \
  --network wp-net \
  -e MYSQL_ROOT_PASSWORD=rootpass \
  -e MYSQL_DATABASE=wordpress \
  -e MYSQL_USER=wp \
  -e MYSQL_PASSWORD=wp \
  docker.io/mariadb:latest

```
     run wordpress
```
podman run -d \
  --name wp \
  --network wp-net \
  -p 8080:80 \
  -e WORDPRESS_DB_HOST=db \
  -e WORDPRESS_DB_USER=wp \
  -e WORDPRESS_DB_PASSWORD=wp \
  -e WORDPRESS_DB_NAME=wordpress \
  docker.io/wordpress
```

    result
now can open wordpress site