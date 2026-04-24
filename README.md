*This project has been created as part of the 42 curriculum by yukravch*

## Description

This project aims to broaden your knowledge of system administration by using Docker.
Docker containers are a powerful way for developers to package and deploy their applications. They are lightweight and provide a consistent, portable software environment for applications to easily run and scale anywhere. 

They are isoleted processes with all needed dependencies.
## Instruction
`make` to compile the project and start the containers
`make clean` to stop the containers
`make fclean` to delete everything ( network, volumes, images, cache )

## Resources
[Dockerdocs](https://docs.docker.com)
[Stephane Robert blog](https://blog.stephane-robert.info/docs/conteneurs/moteurs-conteneurs/docker/)
[Geeks for geeks : about Docker Image](https://www.geeksforgeeks.org/devops/what-is-docker-image/) 
[Docker tuto](https://www.hostinger.com/tutorials/docker-tutorial?utm_source=google&utm_medium=cpc&utm_id=23095904630&utm_campaign=Generic-Tutorials-DSA-t2|NT:Se|Lang:EN|LO:FR&utm_term=&utm_content=781673412846&gad_source=1&gad_campaignid=23095904630&gclid=CjwKCAjwnZfPBhAGEiwAzg-VzARadXB3JUJNFoNsUVJ3odBJ6QB3-PWfn_JkNinMlqhncrr8XLoBGBoC0C8QAvD_BwE)
[what is a container](https://docs.docker.com/get-started/docker-concepts/the-basics/what-is-a-container/)
[grafikart.fr : Dockerfile](https://grafikart.fr/tutoriels/dockerfile-636)
[Docker.hub](https://hub.docker.com)
[dockerdocs : Dockerfile](https://docs.docker.com/reference/dockerfile/) 
[librecours.net : Syntax of Dockerfile](https://librecours.net/modules/picasoft/run/dk02/solweb/co/1_dockerfile.html) 
[Blog about creation of an empty container and configuration of the nginx](https://vanich.cv.ua/linux/nginx/stvoryuyemo-porozhnij-kontejner-v-yakomu/) 
[MariaDB documentation](https://mariadb.com/docs/server/server-management/automated-mariadb-deployment-and-administration/docker-and-mariadb/creating-a-custom-container-image)
[cyberciti.biz : TLS config](https://www.cyberciti.biz/faq/configure-nginx-to-use-only-tls-1-2-and-1-3/)
[Dockerfile](https://www.nicelydev.com/docker/mots-cles-supplementaires-dockerfile#:~:text=Le%20mot%2Dcl%C3%A9%20EXPOSE%20permet,utiliser%20l'option%20%2Dp%20.)
[Network: bridge](https://dev.to/lovestaco/how-to-bridge-networks-in-docker-compose-docker-composeyml-1i03)
[network](https://docs.docker.com/engine/network/)
[network 2](https://docs.docker.com/reference/cli/docker/network/)
[Volumes](https://www.nicelydev.com/docker/volume-docker-compose-yml)
[Volumes 2](https://docs.docker.com/engine/storage/volumes/)
[Bind-mounts](https://docs.docker.com/engine/storage/bind-mounts/)
[.env](https://docs.docker.com/compose/how-tos/environment-variables/set-environment-variables/)
[Create database](https://mariadb.com/docs/server/reference/sql-statements/data-definition/create/create-database)
[Installation mariadb](https://aymeric-cucherousset.fr/installer-mariadb-sur-debian-11/)
[Installation WordPress](https://fr.wordpress.org/support/article/how-to-install-wordpress/)
[Installation Wordpress 2](https://www.linode.com/docs/guides/how-to-install-wordpress-using-wp-cli-on-debian-10/)
[CLI](https://wp-cli.org/)
[cli2](https://make.wordpress.org/cli/)
[install wp-cli](https://github.com/wp-cli/wp-cli)
[Docker prune](https://www.datacamp.com/fr/tutorial/docker-prune)
[secrets](https://kubernetes.io/docs/concepts/configuration/secret/)
[Root vs Alias (nginx conf)](https://stackoverflow.com/questions/10631933/nginx-static-file-serving-confusion-with-root-alias)
[devicon](https://devicon.dev/)
[cv example](https://www.overleaf.com/gallery/tagged/cv)
[css tuturial](https://www.w3schools.com/css/)
[html tutorial](https://www.w3schools.com/html/default.asp)
#### AI was used for:
    used to understand strange logs messages
    explain smth theoretical that was not found online

## Project description
### Docker vs VM
- lighter vs heavier
- uses the the same core as host machine, but internal files are isolated vs internal core - absolutely isolated
- isolated process of the host's core vs isolated computer inside host computer

### Secrets vs Env variables
- encrypted, more protected vs just written inside file

### Docker network vs host network
- isolated inside docker, containers only can communicate with each other insode internal network vs no isolation - use the host's network directly with no isolation 

### Docker Volumes vs Bind Mounts
- tell to docker to create a storage inside docker vs tell that my directory is storage
- docker manage this volumes - I can't really modify the files inside volumes vs just created directory with manual access
- can be checked with `docker volume ls` vs are not visible with `docker volume ls`
example of bind mount
volumes:
    - /home/yukravch/data/wordpress:/var/www/html

### Docker Compose 
- is a configuration file : docker-compose.yml
- is a tool that organizes communication between containers.
- orginize the containers, the volumes and the docker-network

### Dockerfile
![alt_text](../images/image.avif)
Docker can build images automatically by reading the instructions from a Dockerfile. 

### Docker Image

is built from a Dockerfile
- lightweight executable software package that includes everything needed to run an application: the code, a runtime, a system tools, libraries, settings.
- is a platform-independent image that can be built and used on different environments
- command to build a docker image [docker build -t your_image_name:tag -f path/to/Dockerfile]

### Rules

- The project is running on the virtual machine
- Configuration files are in a srcs
- Makefile is required ( for setting up the entire application )

### Containers

Container is a running instance of an image.

- NGINX with TLSv1.2 or TLSv1.3 :
			the only point of the access from the browser
- WordPress + php-fpm ( without nginx ) :
			the logic of the site
- MariaDB ( without nginx ) :
			the data
### Volumes
- are used to store persistent data that should not be lost when a container is stopped or rebuit
	
### NGINX
- hight performance web server
- accepts and processes HTTP requests on the server and returns responses to clients

- myComputer( acting as a local server ) -> nginx -> site
#### HTTP vs HTTPs
- WWW is a set of applications communicationg via the Web protocol called HTTP ( Hypertext Transfer Protocol )
	Client( local server ) send smth to the server

- HTTPs - the same HTTP but secured with cryptographic protocol: SSL or TLS
- TLS is cryptographic protocol.
	Client( local server ) send smth to the server - The web browser encrypts the information and only the server can decrypt this message because it contains a special key. 
	It's called the cryptographic encryption

### MariaDB
- one of the most popular database servers in the world
- by default, will listen on port 3306 ( -p 3306::3306)

### WordPress
- open source blogging tool and a content management system (CMS) based on PHP and MySQL, which runs on a web hosting service
