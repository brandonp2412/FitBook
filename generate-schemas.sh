#!/bin/sh

set -ex

for commit in $(git log -G'schemaVersion' --pretty=format:'%H' -- lib/database.dart); do
    git checkout "$commit"
    dart run drift_dev schema dump lib/database.dart drift_schemas
    git restore pubspec.lock
done

git checkout main