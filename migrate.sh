#!/bin/sh

set -ex

dart run drift_dev schema dump lib/database/database.dart drift_schemas
dart run drift_dev schema generate drift_schemas/ test/generated_migrations/
dart run drift_dev schema steps drift_schemas/ lib/database/schema_versions.dart

if [[ -n "$(git diff --stat '*schema*' '*migration*')" ]]; then
    echo "Migrations need to be made:"
    git --no-pager diff
    exit 1
fi

