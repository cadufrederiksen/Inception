FROM debian:bullseye

RUN apt-get update && apt-get upgrade -y && \
	apt-get install -y php7.4 php7.4-fpm \
	php7.4-mysql wget default-mysql-client

RUN mkdir -p /run/php /var/www

RUN wget https://wordpress.org/latest.tar.gz -P /tmp && \
    tar -xzf /tmp/latest.tar.gz -C /var/www && \
    rm /tmp/latest.tar.gz

RUN chown -R www-data:www-data /var/www/wordpress
RUN chmod -R 755 /var/www/wordpress

RUN wget --header="User-Agent: Mozilla/5.0" https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
	&& chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

COPY conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf
COPY tools/auto_config.sh /auto_config.sh

RUN chmod +x /auto_config.sh

EXPOSE 9000

CMD ["/auto_config.sh"]