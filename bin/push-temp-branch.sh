#!/bin/bash

# Use the current branch name with a temporary suffix:
REFNAME=$(git symbolic-ref HEAD)__temp-${USER}

# Delete any previous temporary commit to prevent the need for a force push
git push origin +:${REFNAME}

# Create a temporary commit from the current working tree but leave the working
# tree itself unmodified:
TEMP_COMMIT=$(git stash create "Temporary commit by ${USER}")

# If the working tree was unmodified no temporary commit was created, in which
# case just use the latest commit to build against:
TEMP_COMMIT=${TEMP_COMMIT:=HEAD}

# Push the temporary commit:
git push origin +${TEMP_COMMIT}:${REFNAME}

