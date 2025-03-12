$string=$args[0]
$UnD=$string  -replace '(\d{2})-(\d{2})-(\d{4})', '$2-$1-$3'


Write-Output $UnD