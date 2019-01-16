{% from "nginx/map.jinja" import nginx with context %}
      
nginx-uninstall:
  service.dead:
    - name: {{ nginx.package }}
    - enable: False
  pkg.removed:
    - pkgs:
      - {{ nginx.package }}
    - require:
      - service: nginx-uninstall
