$str="topor"

$arr=$str.ToCharArray()
[array]::Reverse($arr)
$arr=-join $arr
Write-Output $arr

# $str = "topor"
# $charArray = $str.ToCharArray()
# [array]::Reverse($charArray)
# $reversedStr = -join $charArray
# Write-Output $reversedStr