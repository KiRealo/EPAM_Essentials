#!/bin/bash/

echo "ls pwd hi exit"

while :
do
	read ans dir
	case $ans in
		ls)
			ls $dir
			;;
		pwd)
			pwd
			;;
		hi)
			echo "Hello $USER"
			;;
		exit)
			break
			;;
		esac



done
