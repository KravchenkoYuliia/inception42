FROM debian:bookworm

RUN apt-get update && \
    apt-get upgrade && \
    apt install mariadb-server mariadb-client -y

COPY conf/50-server.cnf etc/mysql/mariadb.conf.d/50-server.cnf
COPY ./tools/script.sh ./tools/script.sh
RUN chmod +x ./tools/script.sh

CMD ["./tools/script.sh"]