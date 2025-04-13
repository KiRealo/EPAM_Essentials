#!/bin/bash

echo "Scripts Name: $0"
echo "all arguments: $*"
echo "number of args: $#"
echo "2 and 4 arg: $2 and $4"
[[ $1 -eq $2 ]]
echo "exit code: $?"


