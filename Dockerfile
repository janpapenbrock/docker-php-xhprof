FROM php:5.6-apache

ADD https://github.com/janpapenbrock/xhprof/tarball/master /opt/xhprof.tar.gz

RUN cd /opt/ && tar -xzf xhprof.tar.gz && mv janpapenbrock-xhprof-* xhprof && rm xhprof.tar.gz && \
    cd xhprof && \
    cd extension && \
    phpize && \
    ./configure && \
    make && \
    make install

RUN echo "extension=xhprof.so" > "/usr/local/etc/php/conf.d/xhprof.ini"

VOLUME /var/www/xhprof
