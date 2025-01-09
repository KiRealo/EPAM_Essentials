$string=$args[0]
$UnD=$string |  Select-String -Pattern '\w{6,}' -AllMatches | ForEach-Object {$_.Matches.Value}


Write-Output $UnD