#!/bin/bash

url=$1
name=`basename $url`


git submodule add $url ~/.vim/bundle/$name
git add ~/.vim/bundle/$name
git commit -m "Install $name bundle as a submodule."
