#!/bin/bash
# Last commit ebea9374ce861901bc601d9d7e8c998541994165
cd ~    
git init .
git remote add origin https://github.com/kwketh/dotfiles.git
git fetch
git reset origin/master --hard
