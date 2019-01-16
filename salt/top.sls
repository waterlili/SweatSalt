base:
  'slave1':
    - mysql
    - mysql.remote.grant
    - mysql.remote.zabbix_mysql
    - zabbix.agent.repo
    - zabbix.agent.conf
  
  'slave3 or slave2 or slave0':
    - mysql.remote
    - zabbix.agent.repo
    - zabbix.agent.conf

  'slave0':
    - apache
    - apache.config
    - mysql.remote.import
    - zabbix.server.repo
    - zabbix.server.conf
    - zabbix.frontend.repo
    - zabbix.frontend.conf
   
  'slave3':
    - apache
    - apache.config
    - apache.vhosts.standard 

  'slave2':
    - php  

  'slave4':
    - nginx
    - nginx.Sblock
