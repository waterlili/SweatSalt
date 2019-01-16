{% from "nginx/map.jinja" import nginx with context %}
{% if not salt['file.directory_exists' ]('/etc/nginx/sites_available') or not salt['file.directory_enabled' ]('/etc/nginx/sites_enabled') %}
directory_site-available:
  file.directory:
    - user:  nginx
    - name:  /etc/nginx/sites-available
    - group:  nginx
    - mode:  755
directory_site-enabled:
  file.directory:
    - user:  nginx
    - name:  /etc/nginx/sites-enabled
    - group:  nginx
    - mode:  755
{% else %}
  cmd.run:
    - name: echo "Directory exists"
{% endif %}

{% for id, site in salt['pillar.get']('apache:sites', {}).items() %}
/etc/nginx/sites-available/{{ id }}.conf:
  file:
    - managed
    - source: salt://nginx/templates/nginx.conf
    - template: jinja
    - context:
      domain: "{{ id }}"
/etc/nginx/sites-enabled/{{ id }}.conf:
  file:
    - symlink
    - target: /etc/nginx/sites-available/{{ id }}.conf
{% endfor %}
#directory_nginx:
#   service.running:
#    - name: {{ nginx.service }}
#    - enable: True

