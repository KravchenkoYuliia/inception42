FROM debian:bookworm

RUN apt-get update && \
    apt-get install -y \
	wget \
	php8.2-fpm \
	php8.2-mysql \
	mariadb-client \
	curl \
	php8.2-gd \
	sendmail && \
	rm -rf /var/lib/apt/lists/*

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
	chmod +x wp-cli.phar && \
	mv wp-cli.phar /usr/local/bin/wp

RUN mkdir -p /var/www/html && \
	chown -R www-data:www-data /var/www/html

COPY conf/www.conf /etc/php/8.2/fpm/pool.d/www.conf
COPY ./tools/script.sh /tools/script.sh
RUN chmod +x ./tools/script.sh

EXPOSE 9000
CMD ["/tools/script.sh"]