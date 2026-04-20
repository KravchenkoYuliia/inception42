FROM debian:bookworm

RUN apt-get update && \
    apt-get install nginx -y && \
    apt-get install openssl -y

RUN mkdir -p /etc/nginx/ssl
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
	-keyout /etc/nginx/ssl/localhost.key \
	-out /etc/nginx/ssl/localhost.crt \
	-subj "/C=FR/ST=France/L=Paris/O=42/OU=Inception/CN=localhost" \
	-addext "subjectAltName=DNS:localhost,IP:127.0.0.1,IP:::1"

RUN chmod 777 /var/www/html
COPY default.conf /etc/nginx/conf.d/default.conf

EXPOSE 443
CMD ["nginx", "-g", "daemon off;"]