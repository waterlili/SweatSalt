# nginx.servers
#
# Manages virtual hosts and their relationship to the nginx service.

{% from 'nginx/map.jinja' import nginx, sls_block with context %}
{% from 'nginx/servers_config.sls' import server_states with context %}
{% from 'nginx/service.sls' import service_function with context %}

{% macro file_requisites(states) %}
      {%- for state in states %}
      - file: {{ state }}
      {%- endfor -%}
{% endmacro %}

include:
  - nginx.service
  - nginx.servers_config

{% if server_states|length() > 0 %}
nginx_service_reload:
  service.{{ service_function }}:
    - name: {{ nginx.lookup.service }}
    - reload: True
    - use:
      - service: nginx_service
    - listen:
      {{ file_requisites(server_states) }}
    - require:
      {{ file_requisites(server_states) }}
      - service: nginx_service
{% endif %}
