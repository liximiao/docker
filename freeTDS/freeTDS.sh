FREETDS_VERSION=0.91

# install freeTDS local files storage
# curl -O http://soft.web.it.loc/data/freetds-$FREETDS_VERSION.tar.gz \
# install freeTDS from the official site
wget ftp://ftp.freetds.org/pub/freetds/stable/freetds-$FREETDS_VERSION.tar.gz \
    && tar -zxf freetds-$FREETDS_VERSION.tar.gz \
    && cd freetds-$FREETDS_VERSION \
		&& ./configure --prefix=/opt/freetds --with-openssl --disable-debug --enable-msdblib --with-tdsver=8.0 --with-unixodbc=/opt/unixODBC \
		&& make -j4 \
		&& make install \
		&& make clean \
		&& cd / \
		&& rm -rf freetds-$FREETDS_VERSION.tar.gz \
		&& rm -rf freetds-$FREETDS_VERSION \
		&& ln -s /opt/freetds/lib /opt/freetds/lib64 \
		&& ln -s /opt/freetds/lib/libtdsodbc.so /opt/freetds/lib/libtds.so
