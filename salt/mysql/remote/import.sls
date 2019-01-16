{% from "zabbix/map.jinja" import zabbix with context -%}
{% set db_ip = salt['mine.get'](pillar['remote_db'], 'network.ip_addrs')[pillar['remote_db']][0] %}
{% set settings = salt['pillar.get']('zabbix-mysql', {}) -%}
{% set sql_file = settings.get('sql_file', '/usr/share/doc/zabbix-server-mysql-3.4.15/create.sql') -%}
{% if 'sql_file' in settings -%}
upload_sql_dump:
  file.managed:
    - makedirs: True
    - source: {{ files_switch('zabbix', [ sql_file ]) }}
    - require_in:
      - import_sql
{% endif -%}
create_db:
  module.run:
    - name: archive.gunzip
    - gzipfile: /usr/share/doc/zabbix-server-mysql-3.4.15/create.sql.gz
mysql_check:
  cmd.run:
    - name: mysql -h {{ db_ip }} -u root zabbix -e "select * from users"
mysql_db:
  cmd.run:
    - name: mysql -h {{ db_ip }} -u root zabbix < {{ sql_file }}
    - onfail: 
      - mysql_check
 
