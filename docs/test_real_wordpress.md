## create network connection for future container
```podman network create wp-net```

## run mariadb
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
## run wordpress
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

## result
now can open wordpress site