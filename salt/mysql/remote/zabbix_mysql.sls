{% from "zabbix/map.jinja" import zabbix with context -%}
{% from "zabbix/macros.jinja" import files_switch with context -%}
{% set db_ip = salt['mine.get'](pillar['remote_db'], 'network.ip_addrs')[pillar['remote_db']][0] %}
{% set settings = salt['pillar.get']('zabbix-mysql', {}) -%}
{% set sql_file = settings.get('sql_file', '/usr/share/doc/zabbix-server-mysql-3.4.15/create.sql') -%}
{% set mysql_root_pass = salt['pillar.get']('mysql:server:root_password',salt['grains.get']('server_id')) %}
root_saltstack:
    mysql_grants.present:
        - grant: all privileges
        - database: '*.*'
        - user: root
        - host: {{ db_ip }}
        - connection_user: root
        - connection_pass: '{{ mysql_root_pass }}'
create_database:
    mysql_database.present:
        - name: zabbix
        - connection_user: root
        - connection_pass: '{{ mysql_root_pass }}'
    mysql_grants.present:
        - grant: all privileges
        - database: zabbix.*
        - user: zabbix
        - host: {{ db_ip }}
        - connection_user: root
        - connection_pass: '{{ mysql_root_pass }}'
zabbix_grants:
    mysql_grants.present:
        - grant: all privileges
        - database: zabbix.*
        - user: zabbix
        - host: '%'
        - connection_user: root
        - connection_pass: '{{ mysql_root_pass }}'
