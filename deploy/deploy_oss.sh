#!/usr/bin/env bash

env=$1
bucket=vimwxnacy
if [[ $env == 'prod' ]]
then
  bucket=vim-cn
fi
echo "部署 ${bucket}"
files="""
css/
images/
docs/
js/
index.html
404.html
README.md
config.js
favicon.png
sidebar.md
"""

for f in $files
do
  echo $f
  if [[ $f == */ ]]
  then
    ossutilmac64 cp $f oss://${bucket}/$f -rfu
  else
    ossutilmac64 cp $f oss://${bucket}/$f -fu
  fi
done

