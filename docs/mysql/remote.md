Install Client
==============

For install mysql client to connect remotely you can use this command 
 
`salt minion_name state.sls mysql.remote`
 
> For each destination we can install seprately mysql client.

Remote Grant
==============

<p> You can specify which servers grant to access this mysql remotely. In this way we should pass a variable in commandline as a pillar dictionary and the command will be like this.X</p>



```
salt target state.sls mysql.remote.grant pillar='{"remote": ["minionX", "minionY","minionZ"]}'
```

Uninstall mysql Client
===================================

```
salt target state.sls mysql.remote.uninstall
```

