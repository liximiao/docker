#!/bin/bash

ODBC_VERSION=2.3.2

# install unixODBC
curl -O http://soft.web.it.loc/data/unixODBC-$ODBC_VERSION.tar.gz \
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

