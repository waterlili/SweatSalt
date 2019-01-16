{% from "mysql/map.jinja" import mysql with context %}

uninstall_mysql:
  service.dead:
    - name: {{ mysql.service }}
    - enable: False
  pkg.removed:
    - names: {{ mysql.pkgs }}
    - require:
      - service: uninstall_mysql
