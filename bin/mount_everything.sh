#!/bin/sh

# Mount all the shares!
# (Comment anything that isn't used regularly enough that I care if it fails.)

findmnt -t fuse.sshfs --target ~/mnt/rti.dev > /dev/null
if [ $? -ne 0 ] ; then
    echo '*** Mount rti.dev on riviera (QA server for BPT updates) ***'
    sshfs paulf@riviera:/home/public/rti.e-pennant.co.uk ~/mnt/rti.dev
fi

findmnt -t cifs --target ~/mnt/temp > /dev/null
if [ $? -ne 0 ] ; then
    echo '*** Mount temp share on shelby ***'
    mn //shelby/temp
fi

findmnt -t cifs --target ~/mnt/jobs_live > /dev/null
if [ $? -ne 0 ] ; then
    echo '*** Mount Jobs Live share on shelby ***'
    mn //shelby/jobs_live
fi

findmnt -t cifs --target ~/mnt/it > /dev/null
if [ $? -ne 0 ] ; then
    echo '*** Mount private IT share on shelby ***'
    mn //shelby/it
fi

findmnt -t cifs --target ~/mnt/casefiles > /dev/null
if [ $? -ne 0 ] ; then
    echo '*** Mount casefiles share on shelby (HMRC BPT helpdesk) ***'
    mn //shelby/casefiles
fi

