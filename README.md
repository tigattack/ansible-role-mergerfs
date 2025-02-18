# Ansible Role: mergerfs

[![Build Status][build_badge]][build_link]
[![Ansible Galaxy][galaxy_badge]][galaxy_link]

Install [MergerFS](https://github.com/trapexit/mergerfs) and manage mountpoints.

Install the role: `ansible-galaxy role install tigattack.mergerfs`

> [!NOTE]
> This role supports Debian-based and RHEL-based distributions.

> [!WARNING] Breaking Change
> `mergerfs_install_mode` is no longer supported in version 2 of this role. Mergerfs will always be installed from GitHub, per the default behaviour in version 1.
> Furthermore, `mergerfs_github_releases_url` is now called `mergerfs_github_repo_url` and should no longer have `/releases` appended.

## Requirements

* `ansible.posix>=1.0.0` collection.

## Role Variables

### `mergerfs_version`

Default: `latest`

Version to install:
* `latest`
* Specific version number, e.g. `2.28.2`

### `mergerfs_mounts`

MergerFS mountpoints to create. The path will be actively mounted and configured in `fstab` by default.

Example:

```yml
mergerfs_mounts:
  - path: /mnt/storage
    branches:
      - /mnt/data*
      - /mnt/other
    options: allow_other,use_ino
```

For further options, see the [ansible.posix.mount](https://docs.ansible.com/ansible/latest/collections/ansible/posix/mount_module.html) documentation.

Supported `ansible.posix.mount` options are:
* `src` (called `branches` in this role)
* `path`
* `opts` (called `options` in this role)
* `state`

Please create an issue if support for further parameters is desired.

### `mergerfs_remove_undefined_mounts`

Default: `false`

Remove any mounted mergerfs filesystems that are not listed in the output of `mergerfs_mounts`.

### `mergerfs_install_prerequisites`

Default: `true`

Whether the role should install prerequisites for using mergerfs. If in doubt, leave default.

Prerequisites for each supported distribution family are listed in their respective files in [vars/](vars/).

### `mergerfs_install_tools`

Default: `false`

Whether to install [mergerfs-tools](https://github.com/trapexit/mergerfs-tools).

> [!NOTE]
> As mergerfs-tools must be cloned from GitHub to install, this role will also ensure `git` is installed on the host if this variable is `true`.

### `mergerfs_github_repo_url`

Default: [`https://github.com/trapexit/mergerfs`](https://github.com/trapexit/mergerfs)

URL of the mergerfs GitHub repository. Used to determine the latest version and download the package.

### `mergerfs_tools_github_repo_url`

Default: [`https://github.com/trapexit/mergerfs-tools`](https://github.com/trapexit/mergerfs-tools)

URL of the mergerfs-tools GitHub repository. Used to clone the repository.

### `mergerfs_tools_clone_dir`

Default: `/tmp/mergerfs-tools`

Temporary directory to clone mergerfs-tools into before install.

## Example Playbook

```yml
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


[build_badge]:  https://img.shields.io/github/actions/workflow/status/tigattack/ansible-role-mergerfs/ci.yml?branch=main&label=Molecule%20test
[build_link]:   https://github.com/tigattack/ansible-role-mergerfs/actions?query=workflow:CI
[galaxy_badge]: https://img.shields.io/ansible/role/d/tigattack/mergerfs
[galaxy_link]:  https://galaxy.ansible.com/tigattack/mergerfs
