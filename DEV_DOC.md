### Commands in Dockerfile
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

### verify that docker is running
	`sudo systemctl status docker`
### if not running
	`sudo systemctl start docker`
### build an image
	`docker build -t myimage .`
	build an image in layers and save the result in Docker engine ( invisible for user, it's not in the directory ).

### to see which images are created
	`sudo docker images`
### run a docker
	`docker run -p 80:80 myimage`
### to see dockers
	`docker ps`
### enter the docker 
	`docker exec -it mycontainer  sh
`
### open web page to see any simple text from nginx.conf
	`http://localhost`
