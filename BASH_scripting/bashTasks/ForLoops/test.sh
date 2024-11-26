#! /bin/bash

sum=0
for i in $@; do
	sum=$((sum+i))
	echo $sum
done

echo "sum $sum" 
echo "number $#"
echo "avrg $(($sum/$#))"

