#!/bin/bash

function square () {
	echo "$(($1 * $1))"
}

function onePlus () {
	
	echo "$(($(square $1) + 1))"
}
onePlus $1
