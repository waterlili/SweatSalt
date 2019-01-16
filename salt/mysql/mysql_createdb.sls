{% set mysql_root_pass = salt['pillar.get']('mysql:server:root_password',salt['grains.get']('server_id')) %}

create new databse:
  mysql_query.run:
    - database: mysql
    - query: "CREATE DATABASE {{ pillar['db_name'] }}"
    - host: 'localhost'
    - connection_user: 'root'
    - connection_pass: '{{ mysql_root_pass }}'
    - connection_charset: utf8

