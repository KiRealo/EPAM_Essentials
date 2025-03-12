$ip1=$args[0]
$ip2=$args[1]
$ipMask=$args[2]
$regexMask='^(25[0-5]|2[0-4][0-9]|[0-1]?[0-9]?[0-9])\.(25[0-5]|2[0-4][0-9]|[0-1]?[0-9]?[0-9])\.(25[0-5]|2[0-4][0-9]|[0-1]?[0-9]?[0-9])\.(25[0-5]|2[0-4][0-9]|[0-1]?[0-9]?[0-9])$'
$regexCIDR='^(3[0-2]|[0-2]?[0-9])$'

# Write-Output ("255.255.256.255" -match $regexMask)

@($ip1,$ip2,$ipMask) | ForEach-Object {
    if($ipMask){
        if($_ -match $regexMask -or $_ -match $regexCIDR){
            Write-Output $true
        }
        else{
            Write-Output $false
        }
    }
    else{ Write-Output ($_ -match $regexMask)}
}