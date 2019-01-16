{% from "mysql/map.jinja" import mysql with context %}
uninstall_mysql:
  service.dead:
    - name: {{ mysql.service }}
    - enable: False
  pkg.removed:
    - name: {{ mysql.remote }}
    - require:
      - service: uninstall_mysql
