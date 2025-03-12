

if ($args[0] -match 'C$'){
    $number=[int]($args[0] -replace '[^\d]', '')
    Write-Output "$args is $($number*1.8+32) in Fahreneit"
}
elseif($args[0] -match 'F$'){
    $number=[int]($args[0] -replace '[^\d]', '')
    Write-Output "$args is $(($number-32)*0.55) in Celsium"
}