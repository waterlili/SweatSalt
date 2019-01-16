#Some step to how use this mysql
1.Install mysql 
installation command
  salt minion_database state.sls mysql pillar='{"remote": "minion_apache"}'
That is clear and show if set remote It mean wich server connect remotly.We can do it seprately
2.Use this command to create database
   salt '*' mysql.db_create 'dbname' 'utf8' 'utf8_general_ci'
#The main refrence for this is here:https://docs.saltstack.com/en/latest/ref/modules/all/salt.modules.mysql.html#salt.modules.mysql.db_create
3.It will allow a remote server connect as a mysql server. This is explain in mysql_grant_remote
4.uninstall mysql 
