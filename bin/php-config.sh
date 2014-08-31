#!/usr/bin/env bash
# PHP 5.5
#--enable-opcache \
#--with-config-file-path=/opt \

# Apache2 Module
#--with-apxs2=/usr/bin/apxs2 \

# Missig Module
#--with-freetype-dir=/usr \

# FPM
#--with-fpm-user=www-data \
#--with-fpm-group=www-data \
#--enable-fpm \


PHP_AVAILABLE_VERSIONS=$(curl -s http://de2.php.net/downloads.php | grep -P '<a href=".*">.+?.tar.bz2' | sed -e 's/.*\<a href\="[^\php-]*\(.*\)/\1/g' -e 's/\.tar.bz2.*//g')

for AV in $PHP_AVAILABLE_VERSIONS; do
	echo $AV
done

SCRIPT_NAME=$(basename $0)
CWD=$(readlink -f $(dirname $SCRIPT_NAME));

echo "Running: $SCRIPT_NAME in $CWD"

if [ ! -f $CWD/configure ]; then
    echo "No build script found. Aborting."
    exit 255
fi

PWD=$(pwd)
PHP_BASE=$(basename $PWD)

if ! echo $PHP_BASE | grep -P '^php-\d+\.\d+\.\d+$' &> /dev/null; then
    echo "unable to parse PHP version from working directory"
    exit 255
fi

PHP_VERSION=$(echo $PHP_BASE | sed -e 's/php-//g')


echo "Building package for PHP $PHP_VERSION."

echo $PHP_CONFIGURE_COMMAND

echo "Press CTRL-C to cancel or ENTER to continue ..."

#if ! read -s; then
#    echo "aborting PHP $PHP_VERSION configure.."
#    exit 255
#fi

./configure \
    --prefix=/opt/php/${PHP_BASE} \
    --with-config-file-path=/opt/php/${PHP_BASE}/etc \
    --disable-short-tags \
    --with-mysql=mysqlnd \
    --with-mysqli=mysqlnd \
    --with-pgsql=/usr \
    --with-tidy=/usr \
    --with-curl=/usr/bin \
    --with-openssl-dir=/usr \
    --with-zlib-dir=/usr \
    --with-xpm-dir=/usr \
    --with-pdo-pgsql=/usr \
    --with-pdo-mysql=mysqlnd \
    --with-xsl=/usr \
    --with-ldap \
    --with-xmlrpc \
    --with-iconv-dir=/usr \
    --with-snmp=/usr \
    --enable-sockets \
    --enable-exif \
    --enable-ftp \
    --enable-calendar \
    --with-bz2=/usr \
    --with-mcrypt=/usr \
    --with-gd \
    --with-jpeg-dir=/usr \
    --with-png-dir=/usr \
    --enable-mbstring \
    --enable-zip \
    --with-pear \
    --with-libdir=/lib/x86_64-linux-gnu \
    --enable-cgi


