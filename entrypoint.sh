#! /usr/bin/env bash

set -eo pipefail
set -x

SALT_LINT_EXTRA_PARAMS="${SALT_LINT_EXTRA_PARAMS}"

set -u

cd "${GITHUB_WORKSPACE}"

if [[ -n "${INPUT_CHANGED_FILES[*]}" ]]; then
>&2 echo "==> Running salt-lint on changed files..."
printf '%s\0' ${INPUT_CHANGED_FILES} | xargs -0 salt-lint ${SALT_LINT_EXTRA_PARAMS}
else
>&2 echo "==> Skipping, no files to lint..."
fi

>&2 echo
