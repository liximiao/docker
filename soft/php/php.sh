PHP_VERSION=5.6.20

# install php-fpm local files storage
# curl -O http://soft.web.it.loc/data/php-$PHP_VERSION.tar.gz \
# install php-fpm from the official site
wget -O php-$PHP_VERSION.tar.gz http://ua2.php.net/get/php-$PHP_VERSION.tar.gz/from/this/mirror \
    && tar -zxf php-$PHP_VERSION.tar.gz \
    && cd php-$PHP_VERSION \
		&& ./configure \
		    '--prefix=/opt/php' \
		    '--enable-fpm' \
		    '--with-fpm-user=sybase' \
		    '--with-fpm-group=sybase' \
		    '--enable-bcmath' \
		    '--with-curl' \
		    '--enable-exif' \
		    '--with-gd' \
		    '--with-gmp' \
		    '--enable-mbstring' \
		    '--with-mcrypt' \
		    '--with-mysql' \
		    '--with-mysqli' \
		    '--with-pdo-mysql' \
		    '--enable-soap' \
		    '--enable-zip' \
		    '--with-config-file-path=/opt/php/etc' \
		    '--with-jpeg-dir' \
		    '--with-png-dir' \
		    '--enable-cli' \
		    '--with-freetype-dir' \
		    '--with-libxml-dir' \
		    '--with-xmlrpc' \
		    '--with-openssl' \
		    '--with-pic' \
		    '--disable-rpath' \
		    '--with-bz2' \
		    '--enable-gd-native-ttf' \
		    '--without-gdbm' \
		    '--with-gettext' \
		    '--with-iconv' \
		    '--with-pcre-regex' \
		    '--with-zlib' \
		    '--with-layout=GNU' \
		    '--enable-ftp' \
		    '--enable-sockets' \
		    '--enable-sysvsem' \
		    '--enable-sysvshm' \
		    '--enable-sysvmsg' \
		    '--enable-wddx' \
		    '--enable-shmop' \
		    '--enable-calendar' \
		    '--with-xsl' \
		    '--disable-dba' \
		    '--without-unixODBC' \
		    '--with-readline' \
		    '--enable-xmlreader' \
		    '--with-ldap' \
		    '--with-ldap-sasl' \
		    '--with-libdir=lib64' \
		    '--with-pear' \
		    '--enable-pcntl' \
		&& make -j"$(nproc)" \
		&& make install \
		&& make clean \
		&& cd / \
		&& rm -rf php-$PHP_VERSION.tar.gz

