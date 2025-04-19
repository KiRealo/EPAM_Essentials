#!/bin/bash


while :
do
       echo "chose command: ls, pwd, hi or exit"
       read input direct


	case $input in
		ls)eval ls $direct;;
		pwd) pwd;;
		hi) echo "Hello $USER";;
		exit) break;;
	esac
done
