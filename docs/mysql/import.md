In order to import sql file put sql file on the server you want to import from and then use this command.

```
salt target state.sls mysql.remote.import 
```
> Here we put it in master server because zabbix will install there and it sounds one of zabbix tasks.
