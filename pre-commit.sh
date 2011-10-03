#!/bin/bash
dir=common
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
