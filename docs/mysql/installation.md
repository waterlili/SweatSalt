Details
---------------
Before installation
After installation the server_id from grains would be the password of mysql and we store it in .my.cnf to connect mysql without any password.

In this section we will install mysql by salt. For that reason, we should use this command. It will seprately install on a server that specified as a target.

```
salt target state.sls mysql
```

<strong>target</strong> is the name of server that mysql will install on.
<p> It will run init file of [mysql](https://github.com/waterlili/saltstak_formulas/tree/master/mysql) directory that located in /srv/salt in fact. We imported a map file that contain list of packages based on OS were installed on target server. </p>


