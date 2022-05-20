#!/bin/sh 
########################################################################
# Create list of all git repo remote URIs in a given folder
# Run like: bash gitrepos.sh | uniq>repos.txt
########################################################################

for d in ~/Workspace/* ; do
   cd $d
   git remote -v| awk '{ print $2 }'
done 