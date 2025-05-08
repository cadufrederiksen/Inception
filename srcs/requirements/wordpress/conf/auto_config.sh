#!/bin/bash
sleep 10

if [ ! -f /var/www/wordpress/wp-config.php ]; then

	wp config create --allow-root \
		--dbname="$MYSQL_DATABASE" \
		--dbuser="$MYSQL_USER" \
		--dbpass="$MYSQL_PASSWORD" \
		--dbhost="mariadb:3306" \
		--path='/var/www/wordpress'

	wp user create "$WP_ADMIN_USER" "$WP_ADMIN_EMAIL" \
		--role=administrator \
		--user_pass="$WP_ADMIN_PASS" --allow-root

	wp user create "$WP_USER" "$WP_EMAIL" \
		--role=subscriber \
		--user_pass="$WP_PASS" --allow-root
fi