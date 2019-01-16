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
