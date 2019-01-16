Installation 
================
To install apache service on a minion we should use this command

```
salt target state.sls apache
```
Configuration
================
In order of config your apache service use this command

```
salt target state.sls apache.config
```
Create Virtualhost
================
we have a list of sites in pillar dictionary.
> By runnig this command they will create. Actually in pillar list there is some options like selecting special template, so We can customize virtualhost template.

```
salt target state.sls apache.vhosts.standard
```


