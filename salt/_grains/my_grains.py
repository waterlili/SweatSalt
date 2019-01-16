from os import system
def Has():
	#php = system('php --version')
        php = 0
        grains = {}
	if php != 0:
    		print 'Missing: PHP'
        else: 
                grains['my_grains'] = { 'php_version' : system('php --version')}
                return grains
