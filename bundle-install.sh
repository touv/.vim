#!/bin/bash

url=$1
name=`basename $url`

cd ~/.vim
git submodule add $url bundle/$name
git add bundle/$name
git commit -m "Install $name bundle as a submodule."
