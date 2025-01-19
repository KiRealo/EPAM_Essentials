$i=0
@("adin","dvas","tris")|ForEach-Object { $i++; Write-Host $($_+ " = "+$i)}
