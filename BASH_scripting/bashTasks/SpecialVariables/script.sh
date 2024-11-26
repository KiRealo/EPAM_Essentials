#!/bin/bash

echo "$0"
for i in $@; do
	echo "$i"
done
echo "Number: $#"
echo "$2 and $4"
[[ $1 -eq $2 ]] && echo 0 || echo 1 
