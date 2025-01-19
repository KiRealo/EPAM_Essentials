# $input="  [ + ]  acpid    "
# $input=$input -split '\s{2,}' | Where-Object {$_.Trim()}
# $input[1]

$input="  [ + ]  acpid    "
$input=$input -split '\s{2,}' 
$input[2]
