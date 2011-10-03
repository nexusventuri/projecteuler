#!/bin/bash
problemName=$1
lib=$problemName/lib
spec=$problemName/spec
mkdir -p $lib
mkdir -p $spec

problem=$lib/problem$problemName.rb
echo "$:.unshift File.expand_path(\"../../../common/lib/\", __FILE__)" >> "$problem"
echo "class Problem$problemName" >> $problem
echo "end" >> $problem

specFile=$spec/problem$problemName\_spec.rb
echo "require 'problem$problemName'" >> $specFile
echo "" >> $specFile
echo "describe Problem$problemName do" >> $specFile
echo "  it \"returns...\" do">> $specFile
echo "  end">> $specFile
echo "end" >> $specFile
