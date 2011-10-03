#!/bin/bash
last_modified_folders=`find . -maxdepth 1 -type d  -printf '%T@ %p\n' |sort -r -n |awk '{print $2}'`

RED="\e[00;31m"
YELLOW="\e[00;33m"
GREEN="\e[00;32m"
WHITE="\e[01;37m"
LIGHT_BLUE="\e[01;34m"
WHITE="\e[01;37m"

loop_count=0
for dir in $last_modified_folders
do
  if [ -d $dir/spec ]; then
    echo ""
    echo "executing tests in $dir"
    cd $dir
    output=`rspec spec`
    if [ $? == 0 ]; then
      echo -e $GREEN
      echo "$output"
    else
      echo -e $RED
      echo "$output"
    fi
    cd ..
    echo -e $WHITE
    echo ""
    echo "----------------------------------"
    echo ""
    loop_count=`expr $loop_count + 1`
    if [ $loop_count = 2 ]; then
      exit
    fi
  fi
done
