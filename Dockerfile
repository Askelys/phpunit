FROM php:7.3

ENV PHPUNIT_COVERAGE_OPTION="--coverage-clover coverage.xml --whitelist test"
ENV PHPUNIT_LOG_OPTION="--log-junit log.xml"
ENV PHPUNIT_OPTIONS=""
ENV PHPUNIT_TARGET="test"

WORKDIR /tmp

# phpunit installation
RUN curl -L https://phar.phpunit.de/phpunit-9.phar -o phpunit \
    && mv phpunit /usr/bin/ \
    && chmod +x /usr/bin/phpunit

# xdebug installation
RUN curl -L https://github.com/xdebug/xdebug/archive/2.9.4.tar.gz -o xdebug.tar.gz \
    && tar -xzf xdebug.tar.gz \
    && cd xdebug-2.9.4/ \
    && phpize \
    && ./configure --enable-xdebug \
    && make \
    && make install

# php configuration
RUN mv $PHP_INI_DIR/php.ini-production $PHP_INI_DIR/php.ini \
    && echo 'zend_extension="/tmp/xdebug-2.9.4/modules/xdebug.so"' >> $PHP_INI_DIR/php.ini

WORKDIR /app

ENTRYPOINT phpunit $PHPUNIT_LOG_OPTION $PHPUNIT_COVERAGE_OPTION $PHPUNIT_OPTIONS $PHPUNIT_TARGET

