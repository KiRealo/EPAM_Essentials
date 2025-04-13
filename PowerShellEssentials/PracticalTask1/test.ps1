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
fromCidrToMask -cidr 27
