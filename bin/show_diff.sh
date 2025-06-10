#!/bin/bash

modified_files=$(svn status | awk '$1 == "M" {print $2}')

for file in $modified_files; do
    read -n 1 -r -p "Show diff for $file? (y/n) " input
    echo ""

    if [[ $input == "y" || $input == "Y" ]]; then
        svn diff "$file" | colordiff | less -R
    elif [[ $input == "q" || $input == "Q" ]]; then
        break;
    fi
done

