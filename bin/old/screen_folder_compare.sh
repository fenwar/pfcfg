#!/bin/bash

# Compare the two screenshot folders and make sure nothing is missing from the osx folder that's present in the windows folder.

# Run this from src/phantom/screenshots

FOLDER=$1

diff \
    <(find baseline_osx/main/bptrti/$1 -type f -not -name "*.diff.png" | sort | sed -e "s/baseline_osx\///") \
    <(find baseline_win/main/bptrti/$1 -type f -not -name "*.diff.png" | sort | sed -e "s/baseline_win\///")
