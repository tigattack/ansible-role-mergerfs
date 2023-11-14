# Ansible Role: mergerfs

[![Build Status][build_badge]][build_link]
[![Ansible Galaxy][galaxy_badge]][galaxy_link]

Install and configure Mergerfs — A featureful union filesystem.

## Requirements

None.

## Role Variables

### `mergerfs_install_mode`

Default: `github_releases`

Defines where to download and install the package from:
 - `github_releases`: install from the mergerfs GitHub releases.
 - `package_manager`: install from the Linux distribution package manager.  
   Note that the mergerfs package does not exists in all distributions, and may be out of date in others, so this will not work under some conditions.

### `mergerfs_version`

Default: `latest`

Version to install:
* `latest`
* Specific version number, e.g. `2.28.2`

> **Note**
> This setting only applies when `mergerfs_install_mode` is `github_releases` (default).

### `mergerfs_mounts`

Mergerfs mountpoints to create. For example:
```
mergerfs_mounts:
  - path: /mnt/storage
    branches:
      - /mnt/data*
      - /mnt/other
    options: allow_other,use_ino
```

### `mergerfs_remove_other_mergerfs_mounts`

Default: `false`

Remove any existing mergerfs mounts that are not listed in `mergerfs_mounts`

### `mergerfs_github_releases_url`

Default: [`https://github.com/trapexit/mergerfs/releases`](https://github.com/trapexit/mergerfs/releases)

URL of the mergerfs GitHub releases page.

### `mergerfs_install_prerequisites`

Default: `true`

Whether the role should install [prerequisites](defaults/main.yml) for you. If in doubt, leave on default.

## Dependencies

None.

## Example Playbook

```yaml
- hosts: server
  roles:
    - role: tigattack.mergerfs
  vars:
    mergerfs_mounts:
      - path: /mnt/data
        branches:
          - /mnt/data1
          - /mnt/data2
        options: allow_other,use_ino
```

## License

MIT

## Author Information

This role was created in 2020 by [Sylvain Prat](https://github.com/sprat).

After Sylvain archived the repository some time ago, I, [tigattack](https://github.com/tigattack), forked it in late 2022 to make some quality of life improvements and keep it maintained.


[build_badge]:  https://img.shields.io/github/actions/workflow/status/tigattack/ansible-role-mergerfs/ci.yml?branch=main
[build_link]:   https://github.com/tigattack/ansible-role-mergerfs/actions?query=workflow:CI
[galaxy_badge]: https://img.shields.io/ansible/role/61203
[galaxy_link]:  https://galaxy.ansible.com/tigattack/mergerfs
