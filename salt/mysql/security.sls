{% from "mysql/map.jinja" import mysql %}
{% set mysql_root_pass = salt['pillar.get']('mysql:server:root_password',salt['grains.get']('server_id')) %}
{% set pass= salt.hashutil.md5_digest('123') %}
mariadb:
  service.running:
    - enable: True
    - reload: True
#root:
#  mysql_user.present:
#    - host: localhost
#    - password: "123"
#    - connection_user: root
#    - connection_pass: ''
set-mysql-root-password:
  cmd.run:
  - name: 'echo "update user set password=PASSWORD(''{{ mysql_root_pass }}'') where User=''root'';flush privileges;" | /usr/bin/env HOME=/ mysql -uroot mysql'
  - onlyif: '/usr/bin/env HOME=/ mysql -u root'
  - require:
    - service: mariadb
change-mysql-root-password:
  cmd.run:
  - name: 'echo "update user set password=PASSWORD(''{{ mysql_root_pass }}'') where User=''root'';flush privileges;" | mysql -uroot mysql'
  - onlyif: '(echo | mysql -u root) && [ -f /root/.my.cnf ] && ! fgrep -q ''{{ mysql_root_pass }}'' /root/.my.cnf'
  - require:
    - cmd: set-mysql-root-password
 
#/root/.my.cnf:
#  file.managed:
#  - user: root
#  - group: root
#  - mode: '0600'
#  - contents: "# this file is managed by salt; changes will be overriden!\n[client]\npassword='{{ mysql_root_pass }}'\n"
#  - require:
#    - cmd: change-mysql-root-password
mysql remove anonymous users:
  mysql_user.absent:
    - name: ''
    - host: 'localhost'
    - connection_user: 'root'
    - connection_pass: '{{ mysql_root_pass }}'
    - connection_charset: utf8
    
mysql remove test database:
  mysql_database.absent:
    - name: test
    - host: 'localhost'
    - connection_user: 'root'
    - connection_pass: '{{ mysql_root_pass }}'
    - connection_charset: utf8

#disable remote login for root:
#  mysql_query.run:
#    - database: 'mysql'
#    - query: "DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');"
#    - host: 'localhost'
#    - connection_user: 'root'
#    - connection_pass: '{{ mysql_root_pass }}'
#    - connection_charset: utf8

mysql_restart:
  module.wait:
    - name: service.restart
    - m_name: 'mariadb.service'

    

 
