# phpunit

phpunit docker image

- [phpunit 7](https://phpunit.de/getting-started/phpunit-7.html)
- php 7.3
- SVN / MYSQL client commands
- [DockerHub](https://hub.docker.com/repository/docker/askelys/phpunit)

## docker usage

- for options see [phpunit command-line documentation](https://phpunit.readthedocs.io/en/7.5/) 
- **environment variables** have priority to configuration file **phpunit.xml**

### docker-compose.yml file example
```yaml
version: "3.7"
services:

  phpunit:
    image: askelys/phpunit-mysqli:7-php7.3
    environment:
        PHPUNIT_OPTIONS: ""
        PHPUNIT_TARGET: ""
    volumes: 
        - "./:/app"
```