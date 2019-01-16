{% from "mysql/map.jinja" import mysql %}
{% set mysql_root_pass = salt['pillar.get']('mysql:server:root_password',salt['grains.get']('server_id')) %}
mariadb:
  service.running:
    - enable: True
    - reload: True

root:
  mysql_user.present:
    # we use password that is set in .my.cnf too
    # there is an object that allow us connect without any password
    # mysql_user.present:
      - host: localhost
      - password: '{{ mysql_root_pass }}'
      #- allow_passwordless: True

mysql remove test database:
  mysql_database.absent:
    - name: test
    - host: 'localhost'
    - connection_user: 'root'
    - connection_pass: '{{ mysql_root_pass }}'
    - connection_charset: utf8

disable remote login for root:
  mysql_query.run:
    - database: 'mysql'
    - query: "DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');"
    - host: 'localhost'
    - connection_user: 'root'
    - connection_pass: '{{ mysql_root_pass }}'
    - connection_charset: utf8

mysql_restart:
  module.wait:
    - name: service.restart
    - m_name: {{ mysql.service }}
