#!/bin/bash
#### 
# Script to read a file list of git repo remote URIs and then clone each repo into
# /Users/Michael.Beddow/Workspace (could easily be parameterised) and if arg one is set then
# also fetch and pull down all remote branches to local git storage
# BE WARNED
# SETTING PULL ALL REMOTES TO TRUE WILL PULL EVERYTHING! THIS COULD BE A LOT AND UNECESSARY!
####

input="/Users/Michael.Beddow/reposnew.txt"
PULL_ALL_REMOTES=${1:-}

echo -e "In $(pwd)"
echo -e "PULL ALL REMOTE BRANCHES=${PULL_ALL_REMOTES}\n\n"

while IFS= read -r line
do
  cd /Users/Michael.Beddow/Workspace
  echo -e "\n\ncloning $line ..........."
  git clone "$line"
  echo -e "\n done *******************"
  if [[ -n ${PULL_ALL_REMOTES} ]]; then
    repoFolderName=${line##*/}
    repoFolderName=${repoFolderName%.*}
    echo "Moving into repo folder named ${repoFolderName}....."
    cd "${repoFolderName}"
    echo -e "\n ***************** Pulling all remote branches... **********************\n"
    git branch -a | grep -v HEAD | perl -ne 'chomp($_); s|^\*?\s*||; if (m|(.+)/(.+)| && not $d{$2}) {print qq(git branch --track $2 $1/$2\n)} else {$d{$_}=1}' | zsh -xfs
    git fetch --all
    git pull --all
    echo "********************* ALL REMOTE BRANCHES FOR ${line} PULLED LOCALLY *******************"
    echo -e "****************************************************************************************\n\n"
  fi
done < "$input"
