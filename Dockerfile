FROM php:7.3


ENV XDEBUG_VERSION="2.9.4"

WORKDIR /tmp

# phpunit installation
RUN curl -L https://phar.phpunit.de/phpunit-9.phar -o /usr/bin/phpunit \
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
    && echo 'zend_extension="/usr/local/lib/php/extensions/no-debug-non-zts-20180731/xdebug.so"' >> $PHP_INI_DIR/php.ini

WORKDIR /app

ENV PHPUNIT_OPTIONS=""
ENV PHPUNIT_TARGET="test"

ENTRYPOINT phpunit $PHPUNIT_OPTIONS $PHPUNIT_TARGET

