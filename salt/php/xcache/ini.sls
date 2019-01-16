# Manages the php cli main ini file
{% from "php/map.jinja" import php with context %}
{% from "php/ini.jinja" import php_ini %}

{% set sett. = php.xcache.ini.defaults %}
{% for key, value in php.xcache.ini.sett..items() %}
  {% if sett.[key] is defined %}
    {% do sett.[key].update(value) %}
  {% else %}
    {% do sett..update({key: value}) %}
  {% endif %}
{% endfor %}

php_xcache_ini:
  {{ php_ini(php.lookup.xcache.ini, php.xcache.ini.opts, sett.) }}
