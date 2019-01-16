include:
   - mysql.packages
   - mysql.security
   #- mysql.firewalld
{% if pillar['remote'] is defined %}
   - mysql.remote.grant
{% endif %}
/root/.my.cnf:
  file.managed:
    - user: root
    - group: root
    - template: jinja
    - source:
      - salt://mysql/my.tmpl

  
