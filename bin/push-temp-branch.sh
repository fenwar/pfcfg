#!/bin/bash

PUSH_REMOTE=${PUSH_REMOTE:-origin}

# Get the user name from the environment, which might be Linux or Windows/MinGW.
# Set ${USER} to the value of ${USERNAME} if it's present (Windows), else fall
# back to ${USER} (Linux):
USER=${USERNAME:-${USER}}

# Use the current branch name with a temporary suffix:
REFNAME=$(git symbolic-ref HEAD)__temp-${USER}

# Warn about any untracked files in the working tree before we proceed (there's
# no obvious way to include these in the stash without potentially affecting
# the work tree):
if git status --porcelain=v1 -uall | grep ^? ; then
    echo "*** WARNING! ***"
    echo "There are unversioned files in your work tree that will not be"
    echo "included in this temporary commit."
fi

# Delete any previous temporary commit to prevent the need for a force push
git push ${PUSH_REMOTE} +:${REFNAME}

# Create a temporary commit from the current working tree but leave the working
# tree itself unmodified:
TEMP_COMMIT=$(git stash create "Temporary commit by ${USER}")

# If the working tree was unmodified no temporary commit was created, in which
# case just use the latest commit to build against:
TEMP_COMMIT=${TEMP_COMMIT:-HEAD}

# Push the temporary commit:
git push ${PUSH_REMOTE} +${TEMP_COMMIT}:${REFNAME}

