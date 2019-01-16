virtualmanager
================
<p>There is a module that is sync with pillars and every extra file that haven't been made made by saltstack would be vanish. If you want to change it logicaly. <strong>Keep in mind</strong> that you should follow some orders</p>
- `salt '*' saltutil.clear_cache`</br>
</br>
- `salt '*' saltutil.sync_all`</br>
</br>
- `salt target virtualmanager.delete_virtual_host`




delete_virtual_host
-----------------------
>This is the name of function that we used in our python module
```
salt target virtualmanager.delete_virtual_host
```
