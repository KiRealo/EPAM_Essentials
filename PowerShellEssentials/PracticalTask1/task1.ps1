[CmdletBinding()]
param(
    [Parameter(Mandatory = $true)]
    [string]$ip_address_1,
    [Parameter(Mandatory = $true)]
    [string]$ip_address_2,
    [Parameter(Mandatory = $true)]
    [string]$network_mask

)
$regexMask = '^(25[0-5]|2[0-4][0-9]|[0-1]?[0-9]?[0-9])\.(25[0-5]|2[0-4][0-9]|[0-1]?[0-9]?[0-9])\.(25[0-5]|2[0-4][0-9]|[0-1]?[0-9]?[0-9])\.(25[0-5]|2[0-4][0-9]|[0-1]?[0-9]?[0-9])$'
$regexCIDR = '^(3[0-2]|[0-2]?[0-9])$'
$maskBool = $false
$ipBool = $false

function fromCidrToMask {
    param(
        [int]$cidr
    )
    $res = 0
    $maskAr = @(0, 0, 0, 0)
    $octet = ([math]::Floor($cidr / 8)) + 1

    for ($i = 0; $i -lt $octet - 1; $i++) {
        $maskAr[$i] = 255
    }
    $remainderOfDivision = $cidr % 8
    for ($j = 7 ; $j -gt (7 - $remainderOfDivision); $j--) {
        $res += [math]::Pow(2, $j)
    }
    if ($octet -lt 5) {
        $maskAr[$octet - 1] = $res
    }
    return $maskAr -join "."
    
}

function findSubnet {
    param(
        [string]$ip,
        [string]$mask
    )
    $subnet = @(0, 0, 0, 0)
    $ipArray = $ip -split "\."
    $maskArray = $mask -split "\."

    for ($i = 0; $i -le 3; $i++) {
        if ($maskArray[$i] -lt 255) {
            $range = 256 - $maskArray[$i]
            $subnet[$i] = $ipArray[$i] - ($ipArray[$i] % $range)
            break
        }
        $subnet[$i] = $ipArray[$i]
    }

    return $subnet -join "."
}

@($ip_address_1, $ip_address_2, $network_mask) | ForEach-Object {
    if ($_ -eq $network_mask) {
        if ($_ -match $regexMask -or $_ -match $regexCIDR) {
            # Write-Output "$_ Correct IP mask format"
            $maskBool = $true
        }
        elseif (-not $network_mask) {
            throw "Empty parameter, fill it next time"
        }
        else {
            throw "Incorrect Mask - $_"
        }
    }
    
    else {

        if ($_ -match $regexMask) {
            # Write-Output "$_ - Correct IP adresss"
            $ipBool = $true
        }
        elseif (-not $_) {
            throw "Empty parameter, fill it next time"
            $ipBool = $false

        }
        else {
            throw "Incorrect IP address"
            $ipBool = $false
        }
    }
}

if ($network_mask -match $regexCIDR) {
    $network_mask = fromCidrToMask -cidr $network_mask
}


$ip_address_1Subnet = findSubnet -ip $ip_address_1 -mask $network_mask
$ip_address_2Subnet = findSubnet -ip $ip_address_2 -mask $network_mask

# if ($maskBool -eq $true -and $ipBool -eq $true) {
#     if ($ip_address_1Subnet -eq $ip_address_2Subnet) {
#         Write-Output "yes"
#     }
#     else {
#         Write-Output "no"
#     }
#     exit 0
# }
# throw "Validation error"

if ($ip_address_1Subnet -eq $ip_address_2Subnet){
    Write-Output "yes"
}
else{
    Write-Output "no"
}
exit 0

