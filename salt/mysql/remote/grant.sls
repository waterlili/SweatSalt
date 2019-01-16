{% set mysql_root_pass = salt['pillar.get']('mysql:server:root_password',salt['grains.get']('server_id')) %}
{% set settings = salt['pillar.get']('zabbix-mysql', {}) -%}
{% set dbname = settings.get('dbname') -%}
{% set dbuser = settings.get('dbuser') -%}
{% for host in salt['pillar.get']('remote',{}) %}
    root_saltstack{{ host }}:
      mysql_grants.present:
           - grant: all privileges
           - database: '*.*'
           - user: root 
           - host: {{ salt['mine.get'](host, 'network.ip_addrs')[host][0] }}
           - connection_user: root
           - connection_pass: '{{ mysql_root_pass }}'
{% endfor %}

