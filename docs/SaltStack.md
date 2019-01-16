Installation
===============

# configuration
> We have saltmaster and salt minion 
> For saltmaster configuration located at:
/etc/salt/master
Master Configuration
---
> Interface  should be the ip address of saltmaster which will use by saltminions.
> There is a file_roots: that help us to recognize our enviroments.
---
# Master installtion
> 
# yum update
# yum install https://repo.saltstack.com/yum/redhat/salt-repo-latest-2.el7.noarch.rpm
# yum clean expire-cache
# yum install salt-master -y

>After the installation finishes,modify configuration
# vim /etc/salt/master
Find and replace master IP (uncomment it)
interface: 192.168.0.161

>Start and enable the salt-master service:
# systemctl start salt-master.service
# systemctl enable salt-master.service

# Minion installation

# yum update
# yum install https://repo.saltstack.com/yum/redhat/salt-repo-latest-2.el7.noarch.rpm
# yum clean expire-cache
# yum install salt-minion -y

>After the installation finishes,modify configuration

# vim /etc/salt/minion
Find and replace master IP (uncomment it)
master: 192.168.0.161

>mention your minion name on minion_id for easy idendification

# systemctl start salt-minion.service
# systemctl enable salt-minion.service

# Accept the Minions
---
# salt-key -L				
---
# salt-key --accept=fox1
---
# salt-key -A
this will accept all minions
---
# salt-key _D
this will delete all minions
---
# salt '*' test.ping	
It will get ping of all server which act as minion
										
Minion Configuration
---
> We specifiy master ip address in /etc/salt/minion
> If we want to connect to mysql we should
> Add mysql section to configuration. 

```
mysql.host: 'localhost'
mysql.port: 3306
mysql.user: 'root'
mysql.pass: ''
mysql.db: 'mysql'
mysql.unix_socket: '/tmp/mysql.sock'
mysql.charset: 'utf8'
```
> Now you can work with your databases

```
salt '*' mysql.db_create 'dbname'
```
> There is list of action [here](https://docs.saltstack.com/en/latest/ref/modules/all/salt.modules.mysql.html)
