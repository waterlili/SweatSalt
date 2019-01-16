For create new Database you can use salt approach or a sls file that we created.

```
Salt:
    - salt '*' mysql.db_create 'dbname'
    
Sls:
    - salt minion_name state.sls mysql.mysql_createdb pillar='{"db_name": testdb}'
```
