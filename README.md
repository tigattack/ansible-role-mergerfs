Ansible Role: mergerfs
======================

[![Build Status](https://api.travis-ci.com/sprat/ansible-role-mergerfs.svg?branch=master)](https://travis-ci.com/sprat/ansible-role-mergerfs)

Install and configure Mergerfs — A featureful union filesystem.

Requirements
------------

None.

Role Variables
--------------

See `defaults/main.yml`.

Dependencies
------------

None.

Example Playbook
----------------

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

License
-------

MIT

Author Information
------------------

This role was created in 2020 by [Sylvain Prat](https://github.com/sprat).
