Zabbix
=========
There are some steps for installing zabbix that we mention them in top file of project but generally we install zabbix server and frontend necessarilyon a server which we want to act as a server for those agents.

Installation
=============
**zabbix-server**
```
salt target state.sls zabbix.server.repo
```
> This one add some repositories depend on zabbix
```
salt target state.sls zabbix.server.conf
```
> configuration of zabbix-server.

