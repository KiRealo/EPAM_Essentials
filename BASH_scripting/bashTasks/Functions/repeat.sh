#!/bin/bash

function raiseOne(){
	function square(){
		echo $(( $1 * $1 ))
	}
	result=$(square $1)
	echo $(($result+1))
}


for i in $@; do
	echo "$(raiseOne i)"
done

