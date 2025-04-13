#! /bin/bash

numValue=$#
if [[ $numValue -lt 2 ]]
then echo "less than 2 - $1"
elif [[ $numValue -gt 2 && $numValue -lt 4 ]]
then echo "${!#}"
else echo "Invalid number of args"
fi
