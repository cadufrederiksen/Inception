FROM debian:bullseye

RUN apt update -y && apt upgrade -y && \ 
    apt-get install mariadb-server -y

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY tools/entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh
RUN mkdir -p run/mysqld && \
    chown -R mysql:mysql run/mysqld && \
    chown -R mysql:mysql /var/lib/mysql && \
    chmod 777 /var/run/mysqld  

EXPOSE 3306
CMD ["/entrypoint.sh"]