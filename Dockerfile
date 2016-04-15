FROM centos:latest
MAINTAINER hipols87@gmail.com

# Add repo
RUN yum install -y curl rpm
RUN rpm -Uvh http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm \
    && yum --enablerepo=remi,remi-test install -y libmcrypt libmcrypt-devel

# Update , apgrade
RUN yum update -y \
    && yum upgrade -y

# Installing the necessary libraries (the list can be replenished)
RUN yum install -y libmcrypt-devel libxml2-devel bzip2-devel libjpeg-devel openldap-devel gmp-devel libxslt-devel \
libcurl-devel libssh2 libssh2-devel gcc openssl-devel unixODBC-devel libpng-devel freetype-devel libc-client-devel readline-devel make autoconf libmemcached-devel.x86_64 glibc-common

# Install wget and other
RUN yum install -y wget nano telnet mc ftp

# Install unixODBC
ADD /soft/unixODBC/unixODBC.sh /opt
RUN chmod +x /opt/unixODBC.sh && sync && /opt/unixODBC.sh

# Install freeTDS
ADD /soft/freeTDS/freeTDS.sh /opt
RUN chmod +x /opt/freeTDS.sh && sync && /opt/freeTDS.sh

# Install php-fpm
ADD /soft/php/php.sh /opt
RUN chmod +x /opt/php.sh && sync && /opt/php.sh

#############################################Add config#############################################
COPY /soft/unixODBC/odbc.ini /opt/unixODBC/etc/
COPY /soft/unixODBC/odbcinst.ini /opt/unixODBC/etc/
RUN cd /opt/freetds/etc/ && rm freetds.conf
COPY /soft/freeTDS/freetds.conf /opt/freetds/etc/
COPY /soft/freeTDS/locales.conf /opt/freetds/etc/