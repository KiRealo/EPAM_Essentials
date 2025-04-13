#!/bin/bash

sum=0
array=$@
for i in $array; do
	(( sum += i ))
done
echo "Sum: $sum"
echo "Args number: $#"
echo "average: $((sum / $#))"
