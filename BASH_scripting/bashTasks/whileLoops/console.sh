#! bin/bash/

while true; do
	echo "Enter command(ls,pwd,hi,exit): "
	read input inpArg
	
	case $input in
		ls)
			ls $inpArg
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





