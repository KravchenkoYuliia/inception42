# default image
FROM debian:bullseye

# who maintain the Dockerfile
LABEL maintainer="yukravch"


RUN apt-get update && \
	    apt-get install -y nginx

# copy the configuration files of nginx
COPY	nginx.conf	/etc/nginx/nginx.conf


# Run web-server nginx / g - global / daemon off - prevent switching to the background
CMD ["nginx", "-g", "daemon off;"]
