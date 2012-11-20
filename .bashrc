#!/bin/bash

. $HOME/management/util/run_scripts
run_scripts .bashrc.d 

if [ -f "$HOME/.bash_aliases" ]; then
    source "$HOME/.bash_aliases"
fi
