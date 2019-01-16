{%- from "mysql/map.jinja" import mysql %}
install_remote_mysql:
  pkg.installed:
      - name: {{ mysql.remote }}
/etc/my.cnf:
  file.managed:
    - source: salt://mysql/my.cnf
    - user: root
    - group: root
    - mode: 644

