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


if [ "x$MAIL_SMTP_FROM_NAME" = "x" ]; then
    MAIL_SMTP_FROM_NAME="ForPDI"
fi
if [ "x$MAIL_SMTP_FROM_EMAIL" = "x" ]; then
    MAIL_SMTP_FROM_EMAIL="forpdi@gmail.com"
fi
if [ "x$MAIL_SMTP_URL" = "x" ]; then
    MAIL_SMTP_URL="localhost2"
fi
if [ "x$MAIL_SMTP_PORT" = "x" ]; then
    MAIL_SMTP_PORT="25"
fi
if [ "x$MAIL_SMTP_USERNAME" = "x" ]; then
    MAIL_SMTP_USERNAME="forpdi"
fi
if [ "x$MAIL_SMTP_PASSWORD" = "x" ]; then
    MAIL_SMTP_PASSWORD=""
fi
if [ "x$MAIL_SMTP_SSL" = "x" ]; then
    MAIL_SMTP_SSL=false
fi
if [ "x$MAIL_SMTP_TLS" = "x" ]; then
    MAIL_SMTP_TLS=false
fi

echo "hibernate.connection.url=jdbc:mysql://$DB_HOST:$DB_PORT/$DB_NAME?autoReconnect=true&amp;useSSL=false" >> $PROPERTIES
echo "hibernate.connection.username=$DB_USERNAME" >> $PROPERTIES
echo "hibernate.connection.password=$DB_PASSWORD" >> $PROPERTIES

echo "smtp.from.name=$MAIL_SMTP_FROM_NAME" >> $PROPERTIES
echo "smtp.from.email=$MAIL_SMTP_FROM_EMAIL" >> $PROPERTIES
echo "smtp.host=$MAIL_SMTP_URL" >> $PROPERTIES
echo "smtp.port=$MAIL_SMTP_PORT" >> $PROPERTIES
echo "smtp.user=$MAIL_SMTP_USERNAME" >> $PROPERTIES
echo "smtp.password=$MAIL_SMTP_PASSWORD" >> $PROPERTIES
echo "smtp.ssl=$MAIL_SMTP_SSL" >> $PROPERTIES
echo "smtp.tls=$MAIL_SMTP_TLS" >> $PROPERTIES

exec $@