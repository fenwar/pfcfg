#!/bin/bash

IPADDR=$1

ping -n -c1 ${IPADDR}
MACADDR=$(grep "${IPADDR}\b" /proc/net/arp | awk '{gsub(":","",$4); print $4}')
echo $MACADDR
echo $MACADDR | xsel -b -i
