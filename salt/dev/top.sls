dev:
  '*':
    - zabbix.uninstall
  'slave1 or slave0 or slave2 or slave3':
    - mysql.uninstall
  'slave4':
    - nginx.uninstall
  'slave3 or slave0':
    - apache.uninstall 
  'slave2':
    - php.uninstall
  
