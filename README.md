# phpunit

phpunit docker image

- [phpunit 9](https://phpunit.de/getting-started/phpunit-9.html)
- php 7.3
- [DockerHub](https://hub.docker.com/repository/docker/askelys/phpunit)

## docker usage

- for options see [phpunit command-line documentation](https://phpunit.readthedocs.io/en/9.1/textui.html#command-line-options) 
- **environment variables** have priority to configuration file **phpunit.xml**

### docker-compose.yml file example
```yaml
version: "3.7"
services:

  phpunit:
    image: askelys/phpunit:9-php7.3
    environment:
        PHPUNIT_OPTIONS: ""
        PHPUNIT_TARGET: ""
    volumes: 
        - "./:/app"
```