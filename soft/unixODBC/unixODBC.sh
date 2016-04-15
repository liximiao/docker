ODBC_VERSION=2.3.2

# install unixODBC local files storage
# curl -O http://soft.web.it.loc/data/unixODBC-$ODBC_VERSION.tar.gz \
# install unixODBC from the official site
wget ftp://ftp.unixodbc.org/pub/unixODBC/unixODBC-$ODBC_VERSION.tar.gz \
   && tar -zxf unixODBC-$ODBC_VERSION.tar.gz \
   && cd unixODBC-$ODBC_VERSION \
               && ./configure \
                   '--prefix=/opt/unixODBC' \
               && make \
               && make install \
               && make clean \
               && cd / \
               && rm -rf unixODBC-$ODBC_VERSION.tar.gz \
               && rm -rf unixODBC-$ODBC_VERSION

