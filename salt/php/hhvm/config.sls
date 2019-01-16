# Manages the php-hhvm main ini file
{% from "php/map.jinja" import php with context %}
{% from "php/ini.jinja" import php_ini %}

{% set server_sett. = php.lookup.hhvm.server %}
{% do server_sett..update(php.hhvm.config.server.sett.) %}

{% set php_sett. = php.lookup.hhvm.php %}
{% do php_sett..update(php.hhvm.config.php.sett.) %}

php_hhvm_ini_config:
  {{ php_ini(php.lookup.hhvm.conf, php.hhvm.config.server.opts, server_sett.) }}

php_hhvm_conf_config:
  {{ php_ini(php.lookup.hhvm.ini, php.hhvm.config.php.opts, php_sett.) }}

