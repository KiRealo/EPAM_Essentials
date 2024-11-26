#! /bin/bash

summ=0
avrg=0
argNum=$#
for i in $@; do	
	summ=$((summ+i))
	echo "summ: $summ"
done
avrg=$((summ/argNum))
echo "average: $avrg" ; echo "args number: $#"


