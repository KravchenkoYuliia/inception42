*This project has been created as part of the 42 curriculum by yukravch*

## Description
## Instruction
## Resources
	[Dockerdocs manual: about Docker Compose](https://docs.docker.com/compose/)
	[Geeks for geeks : about Docker Image](https://www.geeksforgeeks.org/devops/what-is-docker-image/)

#### AI was used for:
	- explaine how I understand a notion and ask if this is how it works or I am wrong


## Project description
### Docker Compose 
	- is a configuration file : docker-compose.yml
	- is a tool that organizes communication between containers.
	- orginize the containers, the volumes and the docker-network

### Docker Image

	is built from a Docker file
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
	





