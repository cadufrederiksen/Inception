#!/bin/bash
sleep 20

echo "HOla antes de crear"

if [ ! -f /var/www/wordpress/wp-config.php ]; then

echo "Creating wp-config.php file..."
echo "$MYSQL_DATABASE"
	wp config create --allow-root \
		--dbname="$MYSQL_DATABASE" \
		--dbuser="$MYSQL_USER" \
		--dbpass="$MYSQL_PASSWORD" \
		--dbhost="mariadb:3306" \
		--path='/var/www/wordpress'

	wp user create "$WP_ADMIN_USER" "$WP_ADMIN_EMAIL" \
		--role=administrator \
		--user_pass="$WP_ADMIN_PASSWORD" --allow-root

	wp user create "$WP_USER" "$WP_USER_EMAIL" \
		--role=subscriber \
		--user_pass="$WP_USER_PASSWORD" --allow-root
fi

exec php-fpm7.3 -F
echo "Wp created"