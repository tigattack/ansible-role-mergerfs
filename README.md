Ansible Role: mergerfs
======================

[![Build Status][build_badge]][build_link]
[![Ansible Galaxy][galaxy_badge]][galaxy_link]

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
  roles:
    - role: sprat.mergerfs
  vars:
    mergerfs_mounts:
      - path: /mnt/data
        branches:
          - /mnt/data1
          - /mnt/data2
        options: allow_other,use_ino
```

License
-------

MIT

Author Information
------------------

This role was created in 2020 by [Sylvain Prat](https://github.com/sprat).


[build_badge]:  https://img.shields.io/github/workflow/status/sprat/ansible-role-mergerfs/CI
[build_link]:   https://github.com/sprat/ansible-role-mergerfs/actions?query=workflow:CI
[galaxy_badge]: https://img.shields.io/ansible/role/47517
[galaxy_link]:  https://galaxy.ansible.com/sprat/mergerfs
