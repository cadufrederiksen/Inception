#!/bin/bash

echo "Waiting for the database to be ready..."
until mysql -h mariadb -u"$MYSQL_USER" -p"$MYSQL_PASSWORD" -e "SHOW DATABASES;" > /dev/null 2>&1; do
    echo "Database is not ready. Retrying in 5 seconds..."
    sleep 5
done
	echo "Database is ready!"


if [ ! -f /var/www/wordpress/wp-config.php ]; then

echo "Creating wp-config.php file..."
echo "$MYSQL_DATABASE"
	wp config create --allow-root \
		--dbhost="mariadb:3306" \
		--dbname="$MYSQL_DATABASE" \
		--dbuser="$MYSQL_USER" \
		--dbpass="$MYSQL_PASSWORD" \
		--path="/var/www/wordpress"

	wp user create "$WP_ADMIN_USER" "$WP_ADMIN_EMAIL" \
		--role=administrator \
		--user_pass="$WP_ADMIN_PASSWORD" --allow-root

	wp user create "$WP_USER" "$WP_USER_EMAIL" \
		--role=subscriber \
		--user_pass="$WP_USER_PASSWORD" --allow-root
fi

exec php-fpm7.3 -F
echo "Wp created"