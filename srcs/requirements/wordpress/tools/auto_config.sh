#!/bin/bash

echo "Waiting for the database to be ready..."
until mysql -h mariadb -u"$MYSQL_USER" -p"$MYSQL_PASSWORD" -e "SHOW DATABASES;" > /dev/null 2>&1; do
    echo "Database is not ready. Retrying in 5 seconds..."
    sleep 5
done
echo "Database is ready!"

if [ ! -f /var/www/wordpress/wp-config.php ]; then
    echo "Creating wp-config.php file..."
    wp config create --allow-root \
        --dbhost="mariadb:3306" \
        --dbname="$MYSQL_DATABASE" \
        --dbuser="$MYSQL_USER" \
        --dbpass="$MYSQL_PASSWORD" \
        --path="$WP_PATH"

    echo "Installing WordPress..."
    wp core install --allow-root \
        --url="$HOST_NAME" \
        --title="$TITLE" \
        --admin_user="$WP_ADMIN_USER" \
        --admin_password="$WP_ADMIN_PASSWORD" \
        --admin_email="$WP_ADMIN_EMAIL" \
        --path="$WP_PATH"

    echo "Creating WordPress subscriber user..."
    wp user create "$WP_USER" "$WP_USER_EMAIL" \
        --role=subscriber \
        --user_pass="$WP_USER_PASSWORD" --allow-root \
        --path="$WP_PATH"

    wp theme install twentytwentytwo --activate --path="$WP_PATH" --allow-root

    wp post create \
        --post_title="Inception project" \
        --post_content="This is the Inception project from 42, made by carmarqu" \
        --post_status=publish \
        --path="$WP_PATH" \
        --allow-root
fi

exec php-fpm7.4 -F
