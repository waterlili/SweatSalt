
<img src="http://yuml.me/diagram/scruffy/class/[note: Here we have --apache ; - zabbix-server ;- zabbix-frontend; **connected to database remotely**!{bg:cornsilk}],[<<SaltMaster>>;zabbix-server], [<<SaltMaster>>;zabbix-server]->[ Php;zabbix-agent], [<<SaltMaster>>;zabbix-server]->[ Nginx;zabbix-agent], [<<SaltMaster>>;zabbix-server]->[ Apache;zabbix-agent],[<<SaltMaster>>;zabbix-server]<->[ Mysql;zabbix-agent],[ Mysql;zabbix-agent]-[note: mysql will use by other servers{bg:cornsilk}]" >
 
Senario
===========
- We want to install zabbix server on salt master 
- Install apache on another server 
- Install nginx on another serever
- Use apache as virtual host and nginx as reverse proxy
- Install zabbix agent on all minions
- Install mysql on a specific server and use it from others(grant to list of minions)
- Install mysql client on list of minions
- Be able to install php on desire server and lots of requirments that we did them in a single command as below

```
salt '*' state.apply pillar='{"remote": ["every minion who wants connect remotely", "minion_php","minion_zabbix"],"remote_db": "minion_database","zabbix_server": "minion_zabbix","proxy": "minion_apache"}' saltenv=base
```
<p>When we want to apply all tasks that wrote on top file use apply. Actually we passed a dictionary that contain remote servers which will access to database and set name of minion that is used as database or zabbix-server. We also set proxy as a server which we read virtual hosts content from there.</p>

Enviroment
==========
> We changed enviroment because we need another layer that affects on all minions so we add new directory
> and add these lines to /etc/salt/master 
-------------
> dev:
>     - /srv/salt/dev

> Now we use another enviroment and delete all we installed before by this 

```
salt '*' state.highstate saltenv=dev
```
> We can replace * with special minion name and delete whatever installed on that server

