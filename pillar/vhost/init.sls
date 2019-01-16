apache:
  sites:
    example.net:
      template_file: salt://apache/vhosts/minimal.tmpl

    example.com: # must be unique; used as an ID declaration in Salt; also passed to the template context as 
      template_file: salt://apache/vhosts/standard.tmpl
  gitrepo:
      https://github.com/waterlili/saltstack/tree/master
