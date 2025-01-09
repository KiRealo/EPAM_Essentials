$string=$args[0]
$UnD=$string | Where-Object { $_ -match "\w+$" } | ForEach-Object {$Matches[0]} | Sort-Object -Unique

Write-Output $UnD