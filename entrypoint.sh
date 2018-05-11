#!/bin/sh
set -e

PROPERTIES=forpdi.properties

echo "" > $PROPERTIES

if [ "x$DB_HOST" = "x" ]; then
    DB_HOST="mysql"
fi
if [ "x$DB_PORT" = "x" ]; then
    DB_PORT="3306"
fi
if [ "x$DB_NAME" = "x" ]; then
    DB_NAME="mysql"
fi
if [ "x$DB_USERNAME" = "x" ]; then
    DB_USERNAME="forpdi"
fi
if [ "x$DB_PASSWORD" = "x" ]; then
    DB_PASSWORD="forpdi"
fi

echo "hibernate.connection.url=jdbc:mysql://$DB_HOST:$DB_PORT/$DB_NAME?autoReconnect=true&amp;useSSL=false" >> $PROPERTIES
echo "hibernate.connection.username=$DB_USERNAME" >> $PROPERTIES
echo "hibernate.connection.password=$DB_PASSWORD" >> $PROPERTIES

exec $@