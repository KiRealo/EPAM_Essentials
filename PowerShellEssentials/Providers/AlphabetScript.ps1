$text=((Get-Content ./SpecificFile -Raw) -split '[ ,.]+').Trim() | Sort-Object -Unique
$text