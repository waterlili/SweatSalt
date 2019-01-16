init-git:
  module.run:
    - name: git.init
    - cwd: /var/www
git-set-url:
  module.run:
    - name: git.remote_set
    - cwd: /var/www
    - remote: origin
    - url: https://github.com/waterlili/saltstack.git
    - https_user: waterlili
    - https_pass: {{ pillar['password'] }}
    - onchanges:
      - module: init-git
