FROM php:7.3


ENV XDEBUG_VERSION="2.9.4"

WORKDIR /tmp

# phpunit installation
RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y subversion default-mysql-client && \
    apt-get autoremove -y && apt-get clean

RUN docker-php-ext-install mysqli

# phpunit installation
RUN curl -L https://phar.phpunit.de/phpunit-7.phar -o /usr/bin/phpunit \
    && chmod +x /usr/bin/phpunit

# xdebug installation
RUN curl -L https://github.com/xdebug/xdebug/archive/${XDEBUG_VERSION}.tar.gz -o xdebug.tar.gz \
    && tar -xzf xdebug.tar.gz \
    && cd xdebug-${XDEBUG_VERSION}/ \
    && phpize \
    && ./configure --enable-xdebug --prefix=/usr/local/ \
    && make -j \
    && make install \
    && rm -rf /tmp/xdebug*

# php configuration
RUN mv $PHP_INI_DIR/php.ini-production $PHP_INI_DIR/php.ini \
    && echo 'zend_extension="xdebug.so"' >> $PHP_INI_DIR/php.ini

WORKDIR /app

ENV PHPUNIT_OPTIONS=""
ENV PHPUNIT_TARGET=""

ENTRYPOINT phpunit $PHPUNIT_OPTIONS $PHPUNIT_TARGET

