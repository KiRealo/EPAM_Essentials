#!/bin/bash

(( ${#1} % 2 == 0 )); [[ $? -eq 0 ]] && echo "even" || echo "odd"
