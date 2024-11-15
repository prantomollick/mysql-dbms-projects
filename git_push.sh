#!/bin/bash

# check if commit message is provided
if [ -z "$1"]
then
    echo "Error: Commit message is required"
    exit 1
fi

# git add all changes;
git add -A

# commit with the provied message;
git commit -m "$1"

# push change to the current branch 
git push -u origin main

echo "Changes have been committed and pushed to the main branch with commit message: '$1'"
