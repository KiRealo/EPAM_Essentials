

$ip = "192.168.1.10"
$mask = "255.255.255.0"


function findSubnetTest {
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


$result = findSubnetTest -ip $ip -mask $mask
Write-Output $result