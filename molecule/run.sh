#!/usr/bin/env bash

set -e

namespace=`yq eval '.galaxy_info.namespace' meta/main.yml`
role_name=`yq eval '.galaxy_info.role_name' meta/main.yml`

role_symlink_dir="./${namespace}.${role_name}"

if [ ! -L "$role_symlink_dir" ]; then
  echo "Creating symlinked role directory for test: $role_symlink_dir"
  ln -s "$(pwd)" "$role_symlink_dir" > /dev/null
fi

pushd "$role_symlink_dir" > /dev/null

molecule "$@" || exit_code=$?

popd > /dev/null

rm "$role_symlink_dir"

exit ${exit_code:-0}
