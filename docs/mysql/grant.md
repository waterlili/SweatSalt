<p> You can specify which servers grant to access this mysql remotely. In this way we should pass a variable in commandline as a pillar dictionary and the command will be like this.X</p>



```
salt target state.sls mysql pillar='{"remote": ["minionX", "minionY","minionZ"]}'
 
```

