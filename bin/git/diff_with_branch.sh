#!/bin/bash

DIFF_PATH=$1
BASE_PATH=${DIFF_PATH/2018/2017}
DIFF_BRANCH=origin/bpt-4752

echo =========================================================================
echo ${BASE_PATH}...${DIFF_PATH}
echo =========================================================================

dwdiff -cblack:red,gray:green -P -C0 -L ${BASE_PATH} <(git show ${DIFF_BRANCH}:${DIFF_PATH})

