FROM centos:latest

# Add repo
RUN rpm -Uvh http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm \
    && yum --enablerepo=remi,remi-test install -y libmcrypt libmcrypt-devel

# Update , apgrade
RUN yum update -y \
    && yum upgrade -y

# Installing the necessary libraries (the list can be replenished)
RUN yum install -y libmcrypt-devel libxml2-devel bzip2-devel libjpeg-devel openldap-devel gmp-devel libxslt-devel \
libcurl-devel libssh2 libssh2-devel gcc openssl-devel unixODBC-devel libpng-devel freetype-devel libc-client-devel readline-devel make autoconf libmemcached-devel.x86_64 glibc-common

# Install wget and other
RUN yum install -y wget nano telnet mc

# Add a local repository
ADD pb.repo /etc/yum.repos.d/

# Add gpgkey
RUN wget http://rpm.web.it.loc/gpgkey -O /tmp/gpgkey &&  rpm --import /tmp/gpgkey && rm -f /tmp/gpgkey

# Install unixODBC
ADD /unixODBC/unixODBC.sh /opt
RUN chmod a+x /opt/unixODBC.sh && ./unixODBC.sh
