#! /bin/bash


echo "you can start stop or kill"

case $1 in
	start) if [ -n "$pid" ]; then
		echo "Service already started"
	else
		echo "Service started"
		sleep 9999 &
		pid=$!
		export pid
	fi
		;;
	stop) if [ -z "$pid" ]; then
		echo "No services on run"
	else
		kill $pid
		unset pid
		echo "Service stoped"
	fi
		;;
	restart) . $BASH_SOURCE stop
		. $BASH_SOURCE start
		;;
	*) echo "Input arguments: start, stop, kill."

	esac
