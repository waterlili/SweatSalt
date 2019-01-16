php-uninstall:
  pkg.removed.present:
    - pkgs:
      - php
      - php-mbstring
      - php-dev
      - php-pear
      - php-gd
      - php-mysql
      - php-xml
      - php-bcmath
      - php-cli
      - php-common

