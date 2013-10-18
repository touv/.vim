#!/bin/bash

name=`basename $1`
cd ~/.vim

## @from http://stackoverflow.com/questions/1260748/how-do-i-remove-a-git-submodule
oldPath="bundle/$name"
git config -f .git/config --remove-section "submodule.${oldPath}"
git config -f .gitmodules --remove-section "submodule.${oldPath}"
git rm --cached "${oldPath}"
rm -rf "${oldPath}"              ## remove src (optional)
rm -rf ".git/modules/${oldPath}" ## cleanup gitdir (optional housekeeping)
git add .gitmodules
git commit -m "Removed ${oldPath}"
