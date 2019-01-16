import os
import shutil

def delete_virtual_host():
    mylist = os.listdir('/var/www/html')
    virhst = os.listdir('/etc/httpd/vhosts.d')
    
    hosts=__salt__['pillar.get']('apache:sites',{}).items()
    vhosts=[]
    vh=[]
    j=0
    '''
     make pillar information as an clear array
    '''
    for i in hosts:
        vhosts.append(i[j])

    for e in mylist:
    #check /var/www directory and delete extra files or directoriesbased on pillart array
        if e in vhosts:
           if os.path.isfile(e):
              os.remove('/var/www/html'+e)
           else:
              continue   
        elif e not in vhosts:
              try:
                os.rmdir('/var/www/html'+e)
              except:
                os.remove('/var/www/html'+e)
        else:
                continue  
    for h in virhst:
    #check /etc/httpd/vhosts.d/ directory and delete extra directories or file based on pillar array
        elemt='/etc/httpd/vhosts.d/'+h
        if h in vhosts:
           if os.path.isdir(elemt):
              os.rmdir(elemt)
           else: 
              continue
        elif ".conf" in h:
           n=h.replace('.conf', '')
           if n not in vhosts:
                   os.remove('/etc/httpd/vhosts.d/'+n+'.conf')
           else:
                continue  
        elif h not in vhosts:
         try:
           os.remove(elemt)
         except:
           os.rmdir(elemt)
