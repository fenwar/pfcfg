#!/bin/bash

# Monitor the systemd network status file for changes and display the
# current IP address when it updates.
# This is intended to run in a tmux monitor window.

NETIFSTATE=/run/systemd/netif/state

ls ${NETIFSTATE} | entr -cn bash -c '
    echo "${NETIFSTATE} last updated on $(date)" ;
    echo ;
    networkctl status ;'
