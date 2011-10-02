#!/bin/bash
problemName=$1
lib=$problemName/lib
spec=$problemName/spec
mkdir -p $lib
mkdir -p $spec

problem=$lib/problem.rb
echo "$:.unshift File.expand_path(\"../../../common/lib/\", __FILE__)" >> $problem 
echo "class Problem" >> $problem
echo "end" >> $problem

specFile=$spec/problem_spec.rb
echo "describe Problem do" >> $specFile
echo "  it \"returns...\" do">> $specFile
echo "  end">> $specFile
echo "end" >> $specFile
