#!/bin/bash/

[[ $# -lt 2 ]] && echo $* && return
[[ $# -gt 2 && $# -lt 4 ]] && echo ${@:$#} && return
echo "invalid number of arguments"
