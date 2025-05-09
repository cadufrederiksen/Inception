#!/bin/bash
set -e

echo ">> Preparando MariaDB..."

# Garante diretório de runtime e permissões
# mkdir -p /run/mysqld
# chown -R mysql:mysql /run/mysqld
# chown -R mysql:mysql /var/lib/mysql


# Cria script SQL com comandos de inicialização
cat << EOF > /tmp/init.sql
ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';
CREATE DATABASE IF NOT EXISTS \`$MYSQL_DATABASE\`;
CREATE USER IF NOT EXISTS '$MYSQL_USER'@'localhost' IDENTIFIED BY '$MYSQL_PASSWORD';
GRANT ALL PRIVILEGES ON \`$MYSQL_DATABASE\`.* TO '$MYSQL_USER'@'localhost';
FLUSH PRIVILEGES;
EOF

# Garante permissões do arquivo e inicia o MariaDB com init-file
chown -R mysql:mysql /tmp/init.sql

echo ">> Iniciando MariaDB com arquivo de inicialização..."
exec mysqld --user=mysql --init-file=/tmp/init.sql