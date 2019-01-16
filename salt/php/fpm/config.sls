# Manages the php-fpm main ini file
{% from 'php/map.jinja' import php with context %}
{% from "php/ini.jinja" import php_ini %}

{% set ini_sett. = php.ini.defaults %}
{% for key, value in php.fpm.config.ini.sett..items() %}
  {% if ini_sett.[key] is defined %}
    {% do ini_sett.[key].update(value) %}
  {% else %}
    {% do ini_sett..update({key: value}) %}
  {% endif %}
{% endfor %}

{% set conf_sett. = php.lookup.fpm.defaults %}
{% do conf_sett..update(php.fpm.config.conf.sett.) %}

php_fpm_ini_config:
  {{ php_ini(php.lookup.fpm.ini, php.fpm.config.ini.opts, ini_sett.) }}

php_fpm_conf_config:
  {{ php_ini(php.lookup.fpm.conf, php.fpm.config.conf.opts, conf_sett.) }}

{{ php.lookup.fpm.pools }}:
    file.directory:
        - name: {{ php.lookup.fpm.pools }}
        - user: root
        - group: root
        - file_mode: 755
        - make_dirs: True
