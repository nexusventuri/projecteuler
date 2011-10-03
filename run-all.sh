#! /bin/bash
folders=`ls`

RED="\e[00;31m"
YELLOW="\e[00;33m"
GREEN="\e[00;32m"
WHITE="\e[01;37m"
LIGHT_BLUE="\e[01;34m"
WHITE="\e[01;37m"

for dir in $folders
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
  fi
done
