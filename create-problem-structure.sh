#!/bin/bash
problemName=$1
lib=$problemName/lib
spec=$problemName/spec
mkdir -p $lib
mkdir -p $spec

problem=$lib/problem.rb
echo "class Problem" >> $problem
echo "end" >> $problem

specFile=$spec/problem_spec.rb
echo "describe Problem do" >> $specFile
echo "\tit \"returns...\" do\n\tend">> $specFile
echo "end" >> $specFile
