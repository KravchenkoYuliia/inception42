FROM debian:bookworm

RUN apt-get update && \
    apt-get upgrade && \
    apt-get -y install \
	php7.3 \
	php8.2 \
	wget \
	php-fpm \
	php-mysql \
	mariadb-client


RUN wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www
RUN cd /var/www && tar -xzf wordpress-6.0-fr_FR.tar.gz && rm wordpress-6.0-fr_FR.tar.gz
RUN		chown -R root:root /var/www/wordpress

COPY conf/www.conf /etc/php/8.2/fpm/pool.d/.
COPY ./tools/script.sh ./tools/script.sh
RUN chmod +x ./tools/script.sh

CMD ["./tools/script.sh"]