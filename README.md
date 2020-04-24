# phpunit

phpunit docker image

- [phpunit 9](https://phpunit.de/getting-started/phpunit-9.html)
- php 7.3
- [DockerHub](https://hub.docker.com/repository/docker/askelys/phpunit)

## docker compose usage
docker-compose.yml file example
```yaml
version: "3.7"
services:

  phpunit:
    image: askelys/phpunit:9-php7.3
    environment:
        PHPUNIT_COVERAGE_OPTION: "--coverage-clover coverage.xml"
        PHPUNIT_LOG_OPTION: "--log-junit log.xml"
        PHPUNIT_OPTIONS: ""
        PHPUNIT_TARGET: ""
    volumes: 
        - "./:/app"
```