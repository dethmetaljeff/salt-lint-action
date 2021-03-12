#! /usr/bin/env bash

set -eo pipefail
set -x

ACTION_STATE_NAME="${ACTION_STATE_NAME:-init.sls}"
ACTION_STATE_FIND_PATTERN="${ACTION_STATE_FIND_PATTERN:-$ACTION_STATE_NAME}"
ACTION_STATE_FIND_PATH="${ACTION_STATE_FIND_PATH:-.}"
ACTION_STATE_FIND_TYPE="${ACTION_STATE_FIND_TYPE:-name}"
SALT_LINT_EXTRA_PARAMS="${SALT_LINT_EXTRA_PARAMS}"

set -u

cd "${GITHUB_WORKSPACE}"

ACTION_STATE_PATH="${GITHUB_WORKSPACE}/${ACTION_STATE_FIND_PATH}"


if [ -d "${ACTION_STATE_PATH}" ]; then
  >&2 echo "==> Linting ${ACTION_STATE_PATH} for files ${ACTION_STATE_FIND_PATTERN}, in ${ACTION_STATE_FIND_PATH}"
  salt-lint ${SALT_LINT_EXTRA_PARAMS} `find "${ACTION_STATE_FIND_PATH}" -type f -regextype posix-egrep -${ACTION_STATE_FIND_TYPE} "${ACTION_STATE_FIND_PATTERN}"`
else
  salt-lint ${SALT_LINT_EXTRA_PARAMS} "${ACTION_STATE_PATH}"
fi

>&2 echo
