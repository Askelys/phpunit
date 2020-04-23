FROM php:7.3-cli

WORKDIR /tmp

RUN apt-get update && apt-get install -y wget && apt-get clean

RUN wget -O phpunit https://phar.phpunit.de/phpunit-9.phar \
    && mv phpunit /usr/bin/ \
    && chmod +x /usr/bin/phpunit

WORKDIR /app

ENTRYPOINT ["phpunit","test"]

