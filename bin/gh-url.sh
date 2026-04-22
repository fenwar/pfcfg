#!/bin/bash
# Print permalinks to lines of code in a GitHub repository.
# If we're on a non-default branch, also print a link to the equivalent code
# on the default branch.
# Depends: git
# Usage: gh-url.sh FILENAME STARTLINE ENDLINE

# Determine the base repo URL
# git@github.com:pennant-intl/bpt.git
GITREMOTE=$(git remote get-url origin)
# If we're not in a repo, exit
if [ $? -eq 128 ] ; then
    echo "try again."
    exit
fi

# Convert git URLs to https:
HTTPSREMOTE=${GITREMOTE/#git@github.com:/https://github.com/}
HTTPSREMOTE=${HTTPSREMOTE/%.git/}
echo REMOTE: ${HTTPSREMOTE}

# Determine the current branch and default branch
CURRENTBRANCH=$(git rev-parse --abbrev-ref HEAD)
DEFAULTBRANCH=$(git rev-parse --abbrev-ref origin/HEAD)
DEFAULTBRANCH=${DEFAULTBRANCH/#origin\//}
echo BRANCH: ${CURRENTBRANCH}
echo DEFAULT BRANCH: ${DEFAULTBRANCH}

# If there's no filename, print the branch and default URL
if [ -z "${1}" ] ; then
    echo BRANCH URL: ${HTTPSREMOTE}/tree/${CURRENTBRANCH}
    echo DEFAULT BRANCH URL: ${HTTPSREMOTE}/tree/${DEFAULTBRANCH}
    exit
fi

# If a start line was supplied, prepare the URL anchor:
if [ -n "${2}" ] ; then
    LINE="#L${2}"
fi

# If an end line was supplied, append it to the URL anchor:
if [ -n "${3}" -a "${3}" != "${2}" ] ; then
    LINE="${LINE}-L${3}"
fi

# Assemble filename link:
echo BRANCH URL: ${HTTPSREMOTE}/blob/${CURRENTBRANCH}/${1}${LINE}
echo DEFAULT BRANCH URL: ${HTTPSREMOTE}/blob/${DEFAULTBRANCH}/${1}${LINE}
