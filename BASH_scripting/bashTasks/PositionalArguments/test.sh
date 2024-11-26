#! /bin/bash

array=$*


for ((i=1 ; i<=$# ; i++)); do
	next=$((i+1))
	echo $((${!i}+${!next}))
	
done

array=0
