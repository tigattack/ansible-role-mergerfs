Ansible Role: mergerfs
======================

[![Ansible Galaxy][galaxy_image]][galaxy_link]
[![Build Status][travis_image]][travis_link]

Install and configure Mergerfs — A featureful union filesystem.

Requirements
------------

None.

Role Variables
--------------

See [defaults/main.yml](defaults/main.yml).

Dependencies
------------

None.

Example Playbook
----------------

```yaml
- hosts: server
  vars:
    mergerfs_mounts:
      - path: /mnt/data
        branches:
          - /mnt/data1
          - /mnt/data2
        options: allow_other,use_ino
  roles:
    - role: sprat.mergerfs
```

License
-------

MIT

Author Information
------------------

This role was created in 2020 by [Sylvain Prat](https://github.com/sprat).


[travis_image]:  https://travis-ci.com/sprat/ansible-role-apt-sources.svg?branch=master
[travis_link]:   https://travis-ci.com/sprat/ansible-role-apt-sources
[galaxy_image]:  https://img.shields.io/badge/galaxy-sprat.apt__sources-660198.svg?style=flat
[galaxy_link]:   https://galaxy.ansible.com/sprat/apt_sources
