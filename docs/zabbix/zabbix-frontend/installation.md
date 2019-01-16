> For zabbix-server we should install zabbix frontend.

Installation
=============
> add repository of zabbix frontend.

```
salt target state.sls zabbix.frontend.repo
```
> config zabbix frontend by this command:

```
salt target state.sls zabbix.frontend.conf
```

