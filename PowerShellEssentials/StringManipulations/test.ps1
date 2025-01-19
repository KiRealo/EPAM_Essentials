[string]$var= "ih_bin_real"

$var=$var -replace '(?<=[_-]).', {"$_".ToUpper()}
# $res = $var -Split '[-_]')
$res=$var.Split([char[]]@('-', '_'))

$res=-join $res 
