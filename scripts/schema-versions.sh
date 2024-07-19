#!/bin/bash

# File and property to track
FILE="lib/database/database.dart"

# Get all commits which changed the property in the file
COMMITS=$(git log --pretty=format:'%H' -- $FILE)

# Loop through each commit
for COMMIT in $COMMITS
do
  # Get the version from the commit
  VERSION=$(git show "$COMMIT:$FILE" | grep -oP "$PROPERTY => \K\d+")

  # Get the closest tag to the commit
  TAG=$(git describe --tags --abbrev=0 $COMMIT)

  # Print the version and tag
  echo "Schema version $VERSION was introduced in tag $TAG"
done