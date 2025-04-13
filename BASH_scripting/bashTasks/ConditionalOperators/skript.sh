#!/bin/bash

[[ $1 == $2 ]]
echo "exit code - $?"

[[ $1 > $2 ]]
echo "Is 1 longer than second - $?"

[[ -n $TEST ]]
echo "TEST variable has non zero value? - $?"

[[ $3 -ne $4 ]]
echo "are 3 and 4 not equal? - $?"

[[ $3 -ge $4 ]]
echo "is 3 ge than 4? - $?"
