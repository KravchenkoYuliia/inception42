## Dockerfile
	create and configure an image
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

### Run a Dockerfile with 
	``
