$string=$args[0]
$UnD=$string | Where-Object { $_ -match "\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}" } | ForEach-Object {$Matches[0]} | Sort-Object -Unique

Write-Output $UnD