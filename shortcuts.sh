#!/bin/bash

# change git checkout to git co
git config --global alias.co checkout
git config --global user.email "chaitanya.r.kale@gmail.com"
git config --global user.name "Chaitanya Kale"


#aliases for git commands
alias gs='git status'
alias gb='git branch'
alias grc='git rebase --continue'
alias gra='git rebase --abort'
alias gpf='git push -f'
alias gfr='gum && git fetch origin && git rebase origin/master'
alias prep='gum && git rebase -i origin/master'
alias gum='git co master && git pull && git co -'
alias goops='git add -A && git commit --amend --no-edit && git push -f'
alias gcleanup="git branch --merged | grep -v '\*\|master\|develop\|main' | xargs -n 1 git branch -d"

function delbranch {
  if [ -z "$1" ]
    then
      echo "You need to specify a branchname";
    return 1;
  fi
  while true; do
    echo "Are you sure you want to delete branch $1? (y/n): "
    read yn
    case $yn in
      [Yy]* ) git push origin --delete $1;git branch -D $1;break;;
      [Nn]* ) break;;
      * ) echo "Please answer yes or no.";;
    esac
  done
}

function fixmaster {
  git fetch origin && git reset --hard origin/master
}
