#!/bin/bash

# Display a terminal clock using figlet
# This is intended to run in a tmux monitor window.

DATE_FORMAT="%H:%M"

watch -p -n1 -t -c \
    'echo "$(tput setaf 1)$(date +'${DATE_FORMAT}' | figlet -t -c -f smmono12)"'
