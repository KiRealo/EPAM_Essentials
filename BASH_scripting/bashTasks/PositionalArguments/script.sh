#! /bin/bash
num=1
for i in $@; do
	echo "Arg$num: $i"
	((num++))
done

for ((i=1 ; i<=$# ; i++)); do
	[[ $i -eq $# ]] && echo $((${!i}+${1})) && break
	next=$((i+1))
	echo $((${!i}+${!next}))
done

