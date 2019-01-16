Tip
==========================
In this senario we use nginx as a reverse proxy 

Installation
==========================
For nginx installation we should use this command

```
salt target state.sls nginx
```
> The main directory for this section is [here](https://github.com/waterlili/salt-collections/tree/master/nginx)
 
ServerBlock
=================
we get list of sites that have been configured in pillar file and generate some server block for them.
> The path of pillar file is [here](https://github.com/waterlili/saltstack_formulas/tree/master/pillar/vhost/init.sls)
