#!/bin/bash

# Mount all the shares!
# (Comment anything that isn't used regularly enough that I care if it fails.)

read -s -p "Password for PENCOM\\paulf: " PENCOM_PSWD
echo

#findmnt -t fuse.sshfs --target ~/mnt/clivesrc > /dev/null
#if [ $? -ne 0 ] ; then
#    echo '*** Mount clive source on clive ***'
#    sshfs paulf@clive:/home/clive/clive ~/mnt/clivesrc
#fi

findmnt -t fuse.sshfs --target ~/mnt/frink > /dev/null
if [ $? -ne 0 ] ; then
    echo '*** Mount www on frink (dev http server) ***'
    sshfs paulf@frink:/home/vhosts/frink ~/mnt/frink
fi

findmnt -t fuse.sshfs --target ~/mnt/rti.dev > /dev/null
if [ $? -ne 0 ] ; then
    echo '*** Mount rti.dev on riviera (QA server for BPT updates) ***'
    sshfs paulf@riviera:/home/public/rti.e-pennant.co.uk ~/mnt/rti.dev
fi

findmnt -t cifs --target ~/mnt/temp > /dev/null
if [ $? -ne 0 ] ; then
    echo '*** Mount temp share on shelby ***'
    . mn //shelby/temp
fi

findmnt -t cifs --target ~/mnt/jobs_live > /dev/null
if [ $? -ne 0 ] ; then
    echo '*** Mount Jobs Live share on shelby ***'
    . mn //shelby/jobs_live
fi

findmnt -t cifs --target ~/mnt/software > /dev/null
if [ $? -ne 0 ] ; then
    echo '*** Mount software share on shelby ***'
    . mn //shelby/software
fi

findmnt -t cifs --target ~/mnt/it > /dev/null
if [ $? -ne 0 ] ; then
    echo '*** Mount private IT share on shelby ***'
    . mn //shelby/it
fi

findmnt -t cifs --target ~/mnt/users > /dev/null
if [ $? -ne 0 ] ; then
    echo '*** Mount users share on shelby ***'
    . mn //shelby/users
fi

findmnt -t cifs --target ~/mnt/casefiles > /dev/null
if [ $? -ne 0 ] ; then
    echo '*** Mount casefiles share on shelby (HMRC BPT helpdesk) ***'
    . mn //shelby/casefiles
fi

#findmnt -t cifs --target ~/mnt/jobs_archive_02 > /dev/null
#if [ $? -ne 0 ] ; then
#    echo '*** Mount backup archive share on PENMANBK02 ***'
#    . mn //penmanbk02/jobs_archive_02
#fi

#findmnt -t cifs --target ~/mnt/cdburn > /dev/null
#if [ $? -ne 0 ] ; then
#    echo '*** Mount CD burning image share on PENMANCD01 ***'
#    . mn //penmancd01/cdburn
#fi
