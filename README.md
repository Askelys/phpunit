# phpunit

phpunit docker image

- [phpunit 9](https://phpunit.de/getting-started/phpunit-9.html)
- php 7.3
- [DockerHub](https://hub.docker.com/repository/docker/askelys/phpunit)

## docker usage

for options see [phpunit command-line documentation](https://phpunit.readthedocs.io/en/9.1/textui.html#command-line-options) 


if you want use **phpunit.xml** file instead of **environment variables** for options declare environment variables with empty string

### environment variables

default environment variable values if not specified

assume **test/** folder exist with file ***Test.php** inside

```yaml
    PHPUNIT_COVERAGE_OPTION: "--coverage-clover coverage.xml --whitelist test"
    PHPUNIT_LOG_OPTION: "--log-junit log.xml"
    PHPUNIT_OPTIONS: ""
    PHPUNIT_TARGET: "test"
```

### docker-compose.yml file example
```yaml
version: "3.7"
services:

  phpunit:
    image: askelys/phpunit:9-php7.3
    environment:
        PHPUNIT_COVERAGE_OPTION: ""
        PHPUNIT_LOG_OPTION: ""
        PHPUNIT_OPTIONS: ""
        PHPUNIT_TARGET: ""
    volumes: 
        - "./:/app"
```