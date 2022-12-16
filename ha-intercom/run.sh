#!/usr/bin/with-contenv bashio

webrootdocker=/var/www/
phppath=/etc/php81/php.ini

rm -r $webrootdocker

echo "Here is your web file architecture."
ls -l $webrootdocker

echo "Starting Nginx..."
exec /usr/sbin/nginx -g "daemon off;"