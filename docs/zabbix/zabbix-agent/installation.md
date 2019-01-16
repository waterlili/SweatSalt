Installation
=======================
> Install zabbix-agent on those servers that we need their logs.

repository
=============
> Add some repositories by this command.
```
salt target state.sls zabbix.agent.repo
```
configuration
=============
```
salt target state.sls zabbix.agent.conf pillar='{"zabbix_server": "minion-of-zabbix-server"}'
```
We pass pillar dictionary to agent configuration and It will specify zabbix-server. 
