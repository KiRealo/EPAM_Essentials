$text=((Get-Content ./SpecificFile -Raw) -split '[ ,.]+').Trim().ToLower() 
| Select-Object -SkipLast 1 #too lazy for searchin empty element
| Sort-Object -Unique 
 | ForEach-Object {
    Add-Content -Path ./Alphabet/$($_[0]).txt -Value $_
}
$text