FROM php:5.6-apache

MAINTAINER Jan Papenbrock <jan@solvium.de>

ADD https://github.com/janpapenbrock/xhprof/tarball/master /opt/xhprof.tar.gz

RUN cd /opt/ && tar -xzf xhprof.tar.gz && mv janpapenbrock-xhprof-* xhprof && rm xhprof.tar.gz && \
    cd xhprof && \
    cd extension && \
    phpize && \
    ./configure && \
    make && \
    make install

RUN echo "extension=xhprof.so" > "/usr/local/etc/php/conf.d/xhprof.ini" && \
    echo "xhprof.output_dir=/var/www/xhprof" >> "/usr/local/etc/php/conf.d/xhprof.ini"

# Install dependencies for xhprof_html call graphs
RUN apt-get update && \
    apt-get install -y graphviz && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

VOLUME /var/www/xhprof
