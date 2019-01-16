{%- from "mysql/map.jinja" import mysql %}
install_mysql:
  pkg.installed:
    - names: {{ mysql.pkgs }}
/etc/my.cnf:
  file.managed:
    - source: salt://mysql/my.cnf
    - user: root
    - group: root
    - mode: 644
reload-mysql:
  service.running:
    - name: {{ mysql.service }}
    - enable: True
    - reload: True
