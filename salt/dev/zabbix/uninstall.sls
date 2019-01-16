{% from "zabbix/map.jinja" import zabbix with context %}
zabbix-uninstall:
  service.dead:
    - name: {{ zabbix.server.service }}
    - enable: False
  pkg.removed.present:
    - pkgs:
      - zabbix
      - zabbix-server
      - zabbix-server-mysql
      - zabbix-web
      - zabbix-web-mysql
      - zabbix-agent
    - require:
      - service: zabbix-uninstall
