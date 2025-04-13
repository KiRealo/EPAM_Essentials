#!/bin/bash

case $1 in
	start) sleep 99 &
		pid=$!
		echo "Service started" ;;
	stop) kill $pid ;;

	restart) . $BASH_SOURCE stop
		. $BASH_SOURCE start
		;;
	*) echo "start stop restart"
esac
