#!/bin/bash

# Display a terminal clock using figlet
# This is intended to run in a tmux monitor window.

TIME_FORMAT="%H:%M"
DATE_FORMAT="%d-%m-%Y   "
FIGLET_FONT="mono12"

watch -p -n1 -t -c \
    'echo "$(tput setaf 1)$(date +'${TIME_FORMAT}' | figlet -t -c -f '${FIGLET_FONT}')$(tput op)" ; echo "$(date +'${DATE_FORMAT}' | figlet -t -c -f wideterm -w72)"'
