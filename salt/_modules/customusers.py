__virtualname__ = 'awesome'

def __virtual__():
    if __grains__['os_family'] == 'Debian':
        return False
    return __virtualname__

def users_as_csv():
    '''
    This is my awesome module
    '''
    user_list = __salt__['user.list_users']()
    csv = ','.join(user_list)
    return csv
