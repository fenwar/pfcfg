#!/bin/bash

# Monitor the systemd network status file for changes and display the
# current IP address when it updates.

NETIFSTATE=/run/systemd/netif/state

ls ${NETIFSTATE} | entr -cn bash -c '
    echo "${NETIFSTATE} last updated on $(date)" ;
    echo ;
    networkctl status ;'
