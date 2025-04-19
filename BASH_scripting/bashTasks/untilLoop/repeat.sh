#!/bin/bash

read -p "write file here: " file
[[ ! -f $file ]] && echo "No such file" &&  return

cp $file temp.txt

echo "before Until loop: $(( $(stat -c %s "$file")/1000))"

until [ $(stat -c %s "$file") -gt 1048576 ]
do
	cp $file temp.txt
	cat temp.txt >> $file
	echo "Now size: $(( $(stat -c %s "$file") /1000 ))"
done
rm temp.txt
head -c 4KB /dev/urandom > file.txt
