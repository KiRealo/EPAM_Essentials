#!/bin/bash
count=1
array=("$@")
index=0
first=${array[0]}

for a in $@; do

	array[$index]=$(( array[$index] + array[$((index+1))] ))
	echo "Arg$count: $a"
	[[ $count -ge ${#array[@]} ]] && array[$(( ${#array[@]} - 1 ))]=$(( array[$(( ${#array[@]} - 1 ))] + $first )) &&  break


	((index+=1))
	((count+=1))

done

echo ${array[@]}

