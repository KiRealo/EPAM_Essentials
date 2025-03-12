$string=$args[0]
$UnD=$string | Where-Object { $_ -match "\b\w+[-_]\b\w+" } | ForEach-Object {$Matches[0]} | Sort-Object -Unique

Write-Output $UnD