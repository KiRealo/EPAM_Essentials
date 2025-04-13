#!/bin/bash

word=$1
woLen=${#word}
if (( $woLen % 2 == 0 )); then
	echo "Even"
else
	echo "Odd"
fi
