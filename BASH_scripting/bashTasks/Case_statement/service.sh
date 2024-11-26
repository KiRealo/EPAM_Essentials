#!/bin/bash


case $1 in 
	start)
	       if [[ -n $pid ]]; then	       
		echo "Service already started"
	else
		sleep 9999 &
		pid=$!
		echo "Service started"
		echo "PID: $pid"
	       fi
	       ;;
	stop)
		[[ -z $pid ]] && echo "Not services" || kill $pid && unset pid && echo "Service stopped"
		;;
	restart)
		. $BASH_SOURCE stop
		. $BASH_SOURCE start
		;;
	*)
		echo "Arguments only start stop restart"
		;;
esac

