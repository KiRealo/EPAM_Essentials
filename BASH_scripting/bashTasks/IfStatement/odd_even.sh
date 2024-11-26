#! /bin/bash

lenght=${#1}
if (( $lenght%2 == 0 ))
then echo "even"
else echo "odd"
fi


