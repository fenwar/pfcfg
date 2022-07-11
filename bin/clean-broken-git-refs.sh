#!/bin/bash

# find any local refs which generate an error and remove them
# This can be used to fix the following error message from git commands:
#
#    error: refs/remotes/origin/branchname does not point to a valid object!
#

git show-ref |& \
    grep -Po '(?<=error: refs/remotes/origin/)[^ ]+' | \
    xargs -i% git push origin +:refs/heads/%
