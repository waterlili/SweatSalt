# Installs php-cli and manages the associated php.ini

include:
  - php.cli.install
  - php.cli.ini

extend:
  php_cli_ini:
    file:
      - require:
        - sls: php.cli.install
